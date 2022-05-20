Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9552E59F
	for <lists+samba-technical@lfdr.de>; Fri, 20 May 2022 09:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=t+WuceGbLrRY15wccKYv/71Dqi+jQafmVPtc2mSdsek=; b=rGr5lgEoJ9/hD6OZgkKnSon3ah
	snKVHA15/z5kiBWGTfWLV86bJ0MNZb49sf1VA8USjfl8dpvG8tvQNYmsRbxEDbSzFs60jWOpD1/So
	MMxYw+AAAeu2BjFl6xO++WoDuMerO9NdkB8475dXqgmjnNYcIVow6RnLQ9+FSa5CSm6a5u5JJJ8O4
	KyFLNvPGAg69hv57DUQckU6F6adwHdxL2ifDej8+A0ql0Dy2EQTdYCcfgfJQ4EarPvr4yM766fr/t
	v/2x8dGG0JAgCN3iq9Yn7SKdE+h97/pNW2WsIsWeKsI2RJr/lvweFYcDq7qXJm+EWymIKW3EyqWgV
	KqPdcfEQ==;
Received: from ip6-localhost ([::1]:61792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrwdx-002ANV-TS; Fri, 20 May 2022 07:01:49 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:60631) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrwdX-002ANM-T4
 for samba-technical@lists.samba.org; Fri, 20 May 2022 07:01:31 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CA61040ACC;
 Fri, 20 May 2022 10:01:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3484035C;
 Fri, 20 May 2022 10:01:20 +0300 (MSK)
Message-ID: <4d5700cf-e39c-e387-439d-d404bc0221e7@msgid.tls.msk.ru>
Date: Fri, 20 May 2022 10:01:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
 <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
 <YoaJUS5Gn0MqIl+L@pinega.vda.li>
 <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
In-Reply-To: <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

19.05.2022 23:15, Michael Tokarev via samba-technical wrote:
..
> ....  Maybe there can
> be some automated way to detect these things. Again, maybe wafsamba
> can help there.

Actually it should stop listing all dependencies of dependencies in
the link command when using shared libraries. Only static libs needs
their dependencies in the linker command line, not the shared libs.
This way the deps will be much more accurate because it will be
obvious when the dep becomes missing.

At the same time it should be possible to fix the random order of
the link-line arguments too.

Alexander, do you know maybe just a little bit how wafsamba works?
In particular, where does it expand dependencies recursively, and
how to tell it to stop the recursion if the given dependency is
a shared library?

/mjt

