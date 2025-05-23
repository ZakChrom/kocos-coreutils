local function write(fd, data)
    local err = syscall("write", fd, data)
    return err == nil, err
end

local function socket(protocol, subprotocol, config)
    local err, sock = syscall("socket", protocol, subprotocol, config);
    return sock, err
end

local function serve(fd, options)
    local err = syscall("serve", fd, options);
    return err == nil, err;
end

local function close(proc, fd)
    local err = syscall("close", fd);
    return err == nil, err;
end

local function accept(fd)
    local err, client = syscall("accept", fd);
    return client, err;
end

local function main(_)
    write(0, "tbd\n");
    return 1;

    -- local sock = assert(socket("domain", "channel", {}));
    -- serve(sock, {
    --     port = 6969,
    -- });

    -- while true do
    --     local client = accept(sock);
    --     write(0, tonumber(client) .. "\n");
    --     close(client);
    --     coroutine.yield();
    -- end

    -- close(sock);
end

local ok, err = xpcall(main, debug.traceback, arg);
if not ok then
    write(2, err .. "\n");
    os.exit(1);
end
os.exit(err or 0);