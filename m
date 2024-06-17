Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78D90AB18
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2024 12:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sMPKIulDNWsZieofi2mACAvgbinCzmsecJf2+Ymc+Xg=; b=CQCgyMWw3R87glu9HP0gNBGLVY
	WJkNrjHkem8zIlAA4eXYn7WL4ZmWZ1CUr707mH0YhpPBUbr5aYThaT6EEPujEn/Vqa4ZobZApbY8H
	STqkJuvjkzCBa8QkxmjdTABzZhMLoDTUQpFiyoXEqWn8dxhgsMX23CN6MXrbdZ48fQh9K4krR9f4R
	Fz+6jvhGMnPfU7X575KeJQQ/uNve57UhIP6eS4KMOYs0cvMPPPhRHMihny7SDdbUr+FlAnef2Dldq
	6vuI1Y7Rcrd/jjw9F+xdc7h+mk2CVf1vlh+cRuiZviZqjzi+8vpmVAD94mkjQmpZgGgfho7SECmCV
	tKo+WE9w==;
Received: from ip6-localhost ([::1]:33658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sJ9dR-00E7Pb-OY; Mon, 17 Jun 2024 10:30:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50390) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJ9dK-00E7Oy-Oi
 for samba-technical@lists.samba.org; Mon, 17 Jun 2024 10:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=sMPKIulDNWsZieofi2mACAvgbinCzmsecJf2+Ymc+Xg=; b=ja2vT7dg5OEgvtVHU2+lvOuzyl
 M7PkG1V/8twpZt6wVKmrWvO5sUs2zbfEab2mRcCDuM5C9D1vUgrqHs1uGXzbBaZN3pYG5ImvlX++O
 EAs5y1VGeyLeXouKJIP6bHpzKGgL1Y1k9Capy0qRxBWpcztHJcfAq00DWeOgzfTkOvhQNzhMpZT26
 ekqajYsLibgfoG9M7LlTGw0y3t2OqrVYh3eih7Z7QU00uNGIjHWSZn6OYZH2G2m1o7e8j9zeMgLqh
 5uLhvXtH3tDxzcAYPQBGJ+q26tyXDk928BvGW7hetKbgOLYwt9Mp8dmOxdniZWNY0RYiair9NJPMy
 KpKEiDGaJiunzjmxiToIjr5+P5Ek2iBv9DFh5mW+Qqfebc7Ud4KZPlMiFW8sbdGUWYceS9CvU29J/
 MLUKTp3aNNsz91Q5wNWa1Q9UEiEh0Ddvo88eoS3C84+1MG2y0STSxbT8/qgvxkrXeu43xAngx5hkv
 ra+WpB4Hr5LLmZZIKtCtrEZe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJ9dJ-00HAVE-18; Mon, 17 Jun 2024 10:30:41 +0000
Message-ID: <35b4b0bc-1e9a-4d69-9fce-ba8782d1ce65@samba.org>
Date: Mon, 17 Jun 2024 12:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: Xavi Hernandez <xhernandez@gmail.com>
References: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
 <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
 <CAO9H7P876Qx8wEN_kfYQKUW7XqMWevfqx7A0kAbf_1UJkmu=zw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P876Qx8wEN_kfYQKUW7XqMWevfqx7A0kAbf_1UJkmu=zw@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xavi,

>>> At the same time, I can also see that getuid()/getgid() returns 0/0 and
>>> geteuid()/getegid() also returns 0/0. Does the default plugin use
>>> uid/gid 0/0 while performing this operation?
>>>
>>> I have the following questions
>>> 1) What are we testing for with this smbtorture test?
>>> 2) Is the anonymous user allowed to modify the DACL of the file as done
>>> in the test? This would obviously lead to access denied errors as we
>>> see currently.
>>
>> It checks the reauthentication has no effect on open file handles
>> only on new file handles. After the SMB2 Create only fsp->access_mask
>> matters for access checking.
>>
>>> 3) What uid/gid should be set when performing this action as the
>>> anonymous user?
>>
>> Maybe you need to remember the low level token at open time
>> and use that.
>>
> 
> I'm not sure if this will work in all cases. When the acl_xattr vfs module
> is used, the Windows ACLs are stored in "security.NTACL". To correctly set
> this xattr, the process needs to become root on a kernel mounted filesystem
> because the kernel doesn't allow a regular user to modify that xattr, even
> if the user has permissions to modify the file.
> 
> If a share uses a vfs module instead of a kernel mount to export the
> filesystem, and that filesystem also requires root privileges to modify the
> "security" namespace, then using the cached permissions at the time of
> opening the file won't be enough.
> 
> I think that the unix token should be kept consistent with the effective
> owner of the process at all times to avoid this problem or similar ones.

We have get_current_utok(), which refects become_root().
Currently that can be used instead of handle->conn->session_info->unix_token.

metze

