Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5206DD61D
	for <lists+samba-technical@lfdr.de>; Tue, 11 Apr 2023 11:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ar0Io4/X/pc8bYUqg7K/M6GUJ7YgaPbY7OP/wXUPya0=; b=d+j9Ua20EK4ft/JKBZ6cm1J1ZL
	CJ12alsPf8XnucpzC4V8JPEQCymNxseF0t8vIeDW8iJ9gdUx1VOv+fSdOkgzLqYBc1+LKU9oVW/Xp
	Gqu3WwuAIRvuwsRhYYJwQvHbRy0fGsQcVYAnSxiDUIGsmhV0oU2khypcljJ6b+z4nQd+CEVFqCOrt
	9x68i36JUApVuwioYx8jpcwqPVj16wYXSPCuMsBBVMXMxszULdCG9W0Xim5MGywnzIp56k7cXoY4N
	3aVnVLMmYM0kocs19X8CwQWbm9veD6+ri0Co3ZYMl0e7YeWOWs9qnktAEgFjjKKobDE7szcKGnhBw
	EG/QXyTg==;
Received: from ip6-localhost ([::1]:56646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pm9tI-000KDh-EL; Tue, 11 Apr 2023 09:02:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pm9tD-000KDY-Bj
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 09:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ar0Io4/X/pc8bYUqg7K/M6GUJ7YgaPbY7OP/wXUPya0=; b=TIl8CQewwO5F0MBJSYxrtSMXAz
 KvhJIP6nglCwrDj4/9/1s8GuvPjKX0rmzan2CyusBp4xpmyVaWQWI7qizu3bRRZNG/okYwNTn3AAM
 4m02CTtOCtMCOT2mcvZhknvu4Q69Y9AEH9mknMsNTDZsa+0BalscCAGPcYpPAtAep3gZyDBCJZbAG
 pWErj6hZfqKnKE+3Dyo0rqMk51+q+U2nl3yzJd9KrfrqhmeIIe066g83eKV1OG/kyhVvI307zB571
 YFlb11Q0PWYE/R7/nr3xX1rWZ9+OTXyQ6qH4XYcsTJWV5+SAd13pofwDGPihJj1Leq7mF6q3mDp0k
 BXhapCbrZYkiT9aTCOZTqyubFHGIZgB7Bcak+g9pIHqKwmhIbqkS0CUy9Zgzkg2cE5VotFSFTeto7
 f94Mcn5LVijmAKN5d/cppbzMY6puxB6PXCfk4xSiqgdi0Xp9V3EBKOUZ9PxEWSAaYFz76aMr12sqq
 q8Q/cKGHmp77dPrt3keSX5EZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pm9tC-000QhY-DH; Tue, 11 Apr 2023 09:02:10 +0000
To: samba-technical@lists.samba.org
Subject: Re: Issue with socket-wrapper socketpair()
Date: Tue, 11 Apr 2023 11:02:09 +0200
Message-ID: <4825342.31r3eYUQgx@magrathea>
In-Reply-To: <ZCqh44RA5PzbQ20g@pc220518.home.grep.be>
References: <ZCqh44RA5PzbQ20g@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Wouter Verhelst <w@uter.be>, jjelen@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Saturday, 8 April 2023 12:25:10 CEST Wouter Verhelst via samba-technical 
wrote:
> Hi,

Hi Wouter,
 
> Currently, the NBD[1] test suite starts nbd-server with a generated
> configuration file, and then runs a special test client against that
> server. This works great, except if you are already running nbd-server
> on the machine where the test is run, in which case (obviously) the
> tester client runs its tests against the wrong server and then things go
> haywire.
> 
> Someone pointed out cwrap to me a while ago, so I had a look at using
> socket-wrapper to isolate nbd-server, and it works great! except for the
> GnuTLS-using tests, and I *think* it's because of how the GnuTLS things
> are implemented in the "test" client: rather than adding an abstraction
> layer which directs a read or write to either a "plain" or a TLS-using
> write, we instead call socketpair(), then fork(), and then on one end of
> the socketpair we implement an encrypting/decrypting proxy. This keeps
> the tester client straightforward (everything continues to use regular
> reads and writes etc on a regular socket) and has no effect on the
> software under test (it's not as efficient, but for a test suite, that's
> fine).

I'm not aware of any issues with socketpair(). We wrap the function but only 
to detect stale file descriptors. So the socketpair() always goes directly to 
libc.

> However, it looks like this setup may not work correctly with
> socket-wrapper. I see that my tester client, after a bit of back and
> forth with the server which functions correctly, loses connectivity.
> This is *not* immediately upon connection, only after a few messages
> have been sent back and forth.

This sounds like a similar issue we had with libssh. Jakub also thought the 
issue is with SOCKET_WRAPPER's small MTU size, but it turned out to be an 
issue in libssh polling code!

https://gitlab.com/cwrap/socket_wrapper/-/merge_requests/34

> Does it seem likely to people here that this is a problem in
> socket-wrapper, or should I be looking at something "odd" I'm doing
> myself?

If it is an issue in socket_wrapper we need a test/reproducer for it. We 
already use socketpair() in tests and those work just fine.


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



