Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D507266B3
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 17:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sLQfyHYrUsOVcxCLu+FZ9GT+2+BKwwDHo4rTLGNYWd8=; b=cYU/gCHFt9yezPFVGAR/FJD1B/
	yIhE3K/kJqK/SYtCVwQIiZ+bjJKYaUvAKaMpNbx/090wO7s6qKBzkDFjRee5thcQRTAFIy5vdZ7yZ
	4aYnmQsgv3uF4KLxYVnsqjPW4xxp2Fqi5Z8XCoPvwrWzLCvQIqLs1Uv3GngYDTfafDxi+xCNG7wGc
	az2+b7ZADk3I4RIDI6rD6y8a0OXUPU+NogEpI94mxD5WiYgoZk2xfBCUOLsADwtreJLOVgc6o6eb+
	sUjLPDNEPqI57oAaKNSiUZ8Mv276RBu3/qv4WVblcCMkbCngTzTJ11qwsr8hXFvYJX4ub9yGK0Axq
	aWyCwMMA==;
Received: from localhost ([::1]:43880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTStg-001IZg-9o; Wed, 22 May 2019 15:11:16 +0000
Received: from [2a01:4f8:192:486::147:1] (port=19852 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTStc-001IZZ-Un
 for samba-technical@lists.samba.org; Wed, 22 May 2019 15:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=sLQfyHYrUsOVcxCLu+FZ9GT+2+BKwwDHo4rTLGNYWd8=; b=iDUb2RCaYqT1twAj+zgUzIu3/A
 gCbAa9DeDqk9KP82xWZgKVuh/lEiid8F1ykuwAz6AbpfTds1GYTbTUiuXqG/uswlHKU0h6aIG2DIm
 gF8ysvWbJdja4xMp3ZC/rVai/7/jWoqHVYFf1MrdJVaFGIYK+N3Z+I3/QmTOUupOQeCk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTStX-0007Lu-M7
 for samba-technical@lists.samba.org; Wed, 22 May 2019 15:11:07 +0000
Subject: Re: Kerberos and Samba client tools
To: samba-technical@lists.samba.org
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
Message-ID: <c2531ef8-94b5-fd17-cd17-c9365a5214fa@samba.org>
Date: Wed, 22 May 2019 16:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/05/2019 15:52, Steve French via samba-technical wrote:
> I was noticing that the username and/or password seems to be ignored
> in different (and possibly confusing to users) ways on various client
> tools (smbcacls and smbclient for example) when you specify -k (for
> Kerberos authentication).
>
> For example if you do:
>
> kinit gooduser
> then
> a) smbclient //server/share -k      (works)
> b) smbclient //server/share -k -U gooduser (works)
> c) smbclient //server/share -k -U gooduser%password (fails with
> "Preauthentication failed", ignores the -k for kerberos presumably and
> tries to authenticate)
> d) smbclient //server/share -k -U baduser (surprisingly works - probably bug)
> e) smbclient //server/share -k -U baduser%password (fails with "client
> not found in Kerberos database" - this is probably confusing given
> that the example without the password worked)
>
> And to make it more confusing smbcacls behavior is different:
> a) smbcacls //server/share file -k
> b) smbcacls //server/share file -k -U baduser
> c) smbcacls //server/share file -k U baduser%password
>
> All work (unlike the equivalent cases in smbclient)
>
> We probably need to figure out what behavior is expected - probably that either
> 1) warn if you specify -U and -k together (since smbcacls ignores it apparently)
> or
> 2) actually use the -U when -k is specified to look for that specific
> user in the kerberos credential cache, and if not found to prompt the
> user for the kerberos password so we can authenticate (kinit or
> equivalent) to Active Directory
>
You forgot 'samba-tool' and the ldb tools (ldbsearch etc) where it is 
'-k yes'

Rowland



