Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 307436DBA0D
	for <lists+samba-technical@lfdr.de>; Sat,  8 Apr 2023 12:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8JPFpe0KbSxrXuX+8YViGBbUVy2wRgliq0+AdmaMlDI=; b=NCowzcgAhWkuo9eYh/RD8Uzkgu
	PtAoXeqTTu9NvXOwY78rCLJvEDnUa5/ocIZeGq3BsYGAOABpspM1XhafP+3gdGTcaGoT6QDsDcYT9
	m6NtVzVtViqnzI1uchfQk6ME6n6tQti3Nc9NEhM+gb8ijEhckrGHFfJXjeAN/Fx1ANn/lvJ4VAFGg
	jEiqTrNqckfwcqxYZ04T7ctCpMxEbtMsogv2iPl4+kOyUr8Ikyu/WSBv/WW9wDudDHq8Tzq8XwJL/
	BhyQHK4IEoZdfHyh2n7xfA4WafibgWF6hbveNaChlA9N5zUIfYh8uHMkyy4bZHgCiWlLJWgHLD8LK
	KSxLB33g==;
Received: from ip6-localhost ([::1]:22608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pl5lD-00ABzV-D5; Sat, 08 Apr 2023 10:25:31 +0000
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2]:32942) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pl5l7-00ABzI-QX
 for samba-technical@lists.samba.org; Sat, 08 Apr 2023 10:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8JPFpe0KbSxrXuX+8YViGBbUVy2wRgliq0+AdmaMlDI=; b=DCBdcZvuOjaWdYlqpzyvXHVJSG
 v0TGPRfPK82t7DGjw0opBuuZEgGMH7TEg/topj+p4X9fZg7mceQhS2fL4+bCudZXRWj4hf5y2cOA+
 g4KueK+3ZzpVO4lwiZ6xMvWZQSyfkjx5xgXUViB3MAv97vY/yhQyp+DpVXSBgJ4/zFZg1Vld/OfeM
 JCWiYtWGHeOmLwdgCsVUt0M7VD1bvMjoEyQJLJyKvbAzJcPvH6l7N6059MzNhGCNJ8SwT8i8Mf3Z4
 1g3eO2mjYMtpbDzw9BlIeuh13hPfnWw1ZFYu3BSEiLqeXK8ZNF1P1MTXctB8MTiL5HMKxJImIqdHx
 MB1ko9Sw==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>) id 1pl5l0-00E6CH-GJ
 for samba-technical@lists.samba.org; Sat, 08 Apr 2023 12:25:18 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pl5ks-000BGO-2p
 for samba-technical@lists.samba.org; Sat, 08 Apr 2023 12:25:10 +0200
Date: Sat, 8 Apr 2023 12:25:10 +0200
To: samba-technical@lists.samba.org
Subject: Issue with socket-wrapper socketpair()
Message-ID: <ZCqh44RA5PzbQ20g@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: none
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
From: Wouter Verhelst via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wouter Verhelst <w@uter.be>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Currently, the NBD[1] test suite starts nbd-server with a generated
configuration file, and then runs a special test client against that
server. This works great, except if you are already running nbd-server
on the machine where the test is run, in which case (obviously) the
tester client runs its tests against the wrong server and then things go
haywire.

Someone pointed out cwrap to me a while ago, so I had a look at using
socket-wrapper to isolate nbd-server, and it works great! except for the
GnuTLS-using tests, and I *think* it's because of how the GnuTLS things
are implemented in the "test" client: rather than adding an abstraction
layer which directs a read or write to either a "plain" or a TLS-using
write, we instead call socketpair(), then fork(), and then on one end of
the socketpair we implement an encrypting/decrypting proxy. This keeps
the tester client straightforward (everything continues to use regular
reads and writes etc on a regular socket) and has no effect on the
software under test (it's not as efficient, but for a test suite, that's
fine).

However, it looks like this setup may not work correctly with
socket-wrapper. I see that my tester client, after a bit of back and
forth with the server which functions correctly, loses connectivity.
This is *not* immediately upon connection, only after a few messages
have been sent back and forth.

Does it seem likely to people here that this is a problem in
socket-wrapper, or should I be looking at something "odd" I'm doing
myself?

(if you want to try to reproduce: check out the git repository, ensure
that libsocket_wrapper.so can be found through pkg-config, and run
"./configure; make check")

Thanks,

[1] https://github.com/NetworkBlockDevice/nbd

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

