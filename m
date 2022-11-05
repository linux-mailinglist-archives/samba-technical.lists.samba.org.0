Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6E61DD40
	for <lists+samba-technical@lfdr.de>; Sat,  5 Nov 2022 19:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oghQckbo6K3W0280vonyBNOXYbWUSMTQzsJjZnaN7sY=; b=2Zej4hn9icOP5Aa2MtpW/zGKVG
	0lwCchtVTFO0Wbb3Ke3ZV0wy1g53ke5SwOR1zzMyCUFASZ/3AalX/ouv1SLICO5PNMq0Rx8xY//bX
	YA2mjoYqlZjZOcq8Twgde81ieXjyMNLNwmxxCexBlNOn9jFLraoXPtXrFA0kFNoN89HxbhM5uljMB
	xfje2yq7W5wy+gYTdaPQK+fF53XaEVj/YrQYChAZ4bjcEDdaJ2QO6r7pHz1xGK3vYkG4daxG29Oml
	FRFVorg7SdDgQ/FLzCKcR6GB5Ahekv09pXtZF2kTQ+wcWXsHwmMKszMzlzT91eGiLlg3hGvH11vEA
	uzY+LKKg==;
Received: from ip6-localhost ([::1]:28640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orNux-00B1eU-4Z; Sat, 05 Nov 2022 18:29:19 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:53097) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orNur-00B1eL-Jv
 for samba-technical@lists.samba.org; Sat, 05 Nov 2022 18:29:16 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F108240547
 for <samba-technical@lists.samba.org>; Sat,  5 Nov 2022 21:29:02 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 476FD3D3
 for <samba-technical@lists.samba.org>; Sat,  5 Nov 2022 21:29:06 +0300 (MSK)
Message-ID: <07424568-38ce-8f3d-4bd4-b0e9bd0e6532@msgid.tls.msk.ru>
Date: Sat, 5 Nov 2022 21:29:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: building all targets in samba for install?
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

Is there a way to build all targets needed for install?

The problem is that `make build' or `make' (or waf build)
doe not build stuff needed to install binaries, it builds
stuff needed to run binaries in place.

Usually, the build sequence of some software is:

  ./configure
  make
  make install

Where the last step does only copying of the already built
files.

But in samba, after doing regular build, it builds whole
thing once again (so `make' step is almost useless).

Is there something like `make install-targets' to perform
all compilation necessary for installing things, but not
the actual install procedure?  So that when `make install'
is run, it will only copy files, without compiling.

The problem at hand is that on debian, the install step is done
as different user (root) than build (to be able to set file
ownership right).  And the root does not have the same build
environment as the build user, so when things are being
compiled at the install time, it does not work right.

In order to overcome this, I currently use `make install'
twice: the first time, as the build user, to install things
into a scratch throw-away place, - just to force all things
to be built.  Next I remove the installed files, and perform
install once again, now as root, into proper place with
proper file ownership.

Is there a way to eliminate this middle fake install step?

Thanks!

/mjt

