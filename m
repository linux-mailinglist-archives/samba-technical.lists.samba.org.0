Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2D4F3D4E
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 21:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vi7Vg+ZPUvzk/fLoC1fhvfyxwSq4H6fb1nIJniHljLc=; b=OkV3rkclyGLux2c9Ki/3aOWkEV
	HiH5HohHFX/fZ9cdGvDI7CtTT6fw8GhMI96nrF/NdaXej+g0A4vKCSbLNbrcmDuKT42s731JwGzMK
	/urW/nvA1+8Rkqjl36jGYRrNJCfiCqO0BIv5mDUlEeDBhopoe4GWpzOuM9a7OJxCm80ubOpwcW67e
	c3bGwXX+x6Jo0gDeTsgyr59bKKO+ypKSH9lhvC2Ha+GJsPLHi5mscFukfSKReTDvhkQkHgMt/q5yU
	9wEWmexHPH9sLFkNlVfA8iBLlgWZ8XZkP7yZq7jig/q0PlKLS2FXgauFhacHC24uE9YZFZ4FdLEaF
	VjRsx/+Q==;
Received: from ip6-localhost ([::1]:38934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbod8-00AD4p-B8; Tue, 05 Apr 2022 19:14:18 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51415) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbod4-00AD4f-Hb
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 19:14:16 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1870740150;
 Tue,  5 Apr 2022 22:14:12 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 934B930C;
 Tue,  5 Apr 2022 22:10:25 +0300 (MSK)
Message-ID: <794ca2a4-6d67-ae04-2dec-ca291d633cc8@msgid.tls.msk.ru>
Date: Tue, 5 Apr 2022 22:14:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
 <9327243.eNJFYEL58v@krikkit>
In-Reply-To: <9327243.eNJFYEL58v@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

05.04.2022 22:01, Andreas Schneider wrote:
> On Tuesday, 5 April 2022 00:52:14 CEST Michael Tokarev via samba-technical
> wrote:
>> So it looks like the answer is "no" :)
>>
>> I just dislike the hacking around renames or duplicating the
>> source tree for different builds.. :)
> 
> `git worktree` is your friend ;-)

Yeah, Andreas, thank you for the tip!  I use it here quite a lot.

Unfortunately I was asking about something different. Think automated
build of an src.rpm on different architectures with running the testsuite
in the process. Unlike of rpm, who has whole build directory available
and extracts source in a subdir, in debian it is done differently:
the build system has to work from within the already extracted source
dir. And everything's done inside. So the sequence, most likely, will
be like this:

  configure, build normally
  run tests:
    mv bin bin.prod
    configure --enable-selftests; build; run tests
    rm -rf bin
    mv bin.prod bin
  install:
    install from bin/

This is because the build script is called to build things
first, to test them if build was okay, and to install things
if tested good.

If there was a way to specify --out=./bintest things
would be much cleaner.

Unfortunately, as it turns out, there are quite some things
in there which makes this to fail, eg:

buildtools/wafsamba/samba3.py:                            '../bin/default/third_party/heimdal/lib/asn1' ]
buildtools/wafsamba/samba_headers.py:        if hpath.startswith("bin/default/"):
buildtools/wafsamba/samba_wildcard.py:    if cmd[0:12] == "bin/default/":
docs-xml/manpages/smb.conf.5.xml:               <!-- WAF build places it in bin/default/docs-xml/smbdotconf/parameters.all.xml //-->
selftest/wscript:    os.environ['CONFIG_H'] = 'bin/default/include/config.h'

/mjt

