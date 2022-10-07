Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 054775F7C1B
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 19:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oMmfmBopEBygkXXEacjDvPSpwJ+lxlu1Lc4kEacq/fY=; b=QzWFBvcHyyI80MAh9wSeANNxj/
	L0CKYVY8JHOkvQVuReCd9AcdbAT0SMPb+rSle/tVJ+7f9pRz8iUrUU2aSj3JrdCbniigy5x+nNTQR
	jd8D8fZsGS2i6jgPjVEQHMTzH1dGvtOO2tcXo8q7llWaaJhR7kq04cWL9zWLeFh1m8FI4o5I8hFEz
	YV5tfvEzBma1B89AOtT05WLQG/zueJ13o0+f6iXC0lkq/k6ngqc8kaGdiiZy+tEeqSruN6CUmSkKa
	Kw9885JonO5U/pgB1rs5SO6SO8iA0lFos/XhjVEt7jANCR8WOnKChMnpiE5+Q6kqKAE4aXwQqTr5X
	jMztsf5A==;
Received: from ip6-localhost ([::1]:33002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogqux-000fET-Lz; Fri, 07 Oct 2022 17:13:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogqus-000fEK-69
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 17:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oMmfmBopEBygkXXEacjDvPSpwJ+lxlu1Lc4kEacq/fY=; b=AbL/rAr1lGFSn+zui6ddM8fYSb
 eddZlLtxwGJC9JlA+wTY48uGHK9arqI5keYEoF8MRBSA8pd0QcIfmotAxK6jovr/+3cz7TjTqEOxr
 iU8TUzs4pA1ZikBlkFKeATAREXCoiuk+11gFRztXJVw1wMk5wa7/YkhCtAHUjdfZ5OM7BIj1jI7X/
 J4rGvxACodpmDsNjXQz7Ggrw7Hqn01hHg74mQvEz4E13IE2/Y1PKOp/i8fPA01w60YphJ8DK5r9mK
 aKEAiz/Rvtk4DhfSS2g+2uQIEKP3xTESPN+SLtGmYuG0XFvDDOGJZ1kt6ZEIsP7oiwtLoufUkBl+e
 CUCtHAdwV8XwXQ6VO/8Hcyg8sqcn+YcssJu/aMeuzoqacFAGDtscT5q0W4HCH7BWCf6AW67xKvZqv
 otm617flZI6qHzq9/dwQAd9gXyi7snXL7XTnsPmAeV6+eBp8QFIx4fXP3OhXJ7Fl93xaeHjG60eMH
 0tGCJQXJS+BTbPWFmQGzgIcY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogquq-003PUw-Gu; Fri, 07 Oct 2022 17:13:40 +0000
Date: Fri, 7 Oct 2022 10:13:37 -0700
To: Pavel =?iso-8859-1?Q?Filipensk=FD?= <pfilipensky@samba.org>
Subject: Re: vfs_crossrename not working in samba-4.15.*
Message-ID: <Y0BeQaOAji8jXhgc@jeremy-acer>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
 <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 07, 2022 at 04:25:19PM +0200, Pavel Filipenský via samba-technical wrote:
>I believe that the bug was introduced in
>
>5c18f07 2021-06-16 21:01 -0700 Jeremy Allison     o s3: VFS: 
>crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>
>
>which removes
>
>-       if (unlink (dest) && errno != ENOENT) {
>
>and adss
>
>
>+       ret = SMB_VFS_NEXT_UNLINKAT(handle,..
>+       if (ret == -1) {

Well calling "unlink()" directly is (a) symlink-unsafe,
and (b) means this module is completely unstackable
and not usable on anything other than a local filesystem.

So I stand by the change :-). We just need to figure
out the locking issues.

