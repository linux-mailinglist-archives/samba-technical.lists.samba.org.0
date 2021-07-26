Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD63D68CC
	for <lists+samba-technical@lfdr.de>; Mon, 26 Jul 2021 23:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XTGFJ/nE8DpR8sEbR/SvbQ9LEuPKFc2t7AMazknj0ko=; b=jesHUrV9fIFrZ9ls/2OcE/26b9
	uwUYoRgvQxQJGTEKfDTD4Ku/KEsqkuy7gCzBbYq3kbmv9bAqRc9c0Dia4gl7bO7rp0qgRuikwBPcJ
	FugEWSGqv3x8tdBqW8fSrodDbZeY/oZV2W71n2Ig/c4rObJ16X4j3CuIr5ZxyZ+v01CBYdL4045wI
	axrtGy3oTwXLHO0gD5JMVQrbv4IeYcR8/U8iRHVz+tHoa3pi5kX0WV2bHF+pLB5o08eBzZef6sooQ
	TFgOsp69EY/FwDbRvOFeJET/mMYlehD7uIgMHYHSeg/2920/izi3POFWzr4890AZifpFFbl/L4TxM
	BpioSZXA==;
Received: from ip6-localhost ([::1]:54678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m88JY-000vpr-Mo; Mon, 26 Jul 2021 21:39:08 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m88JQ-000vpi-BJ
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 21:39:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id f13so9804825edq.13
 for <samba-technical@lists.samba.org>; Mon, 26 Jul 2021 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZCROl+gLjbd8PlmqTy7uFAn3mUMnNkhd9ZvCME6hUc=;
 b=OYxS03hR8u7rV1G0grmSaMETrQofYvcGYh5OipUUg+LI4wxFBhwBDDaVDmJonpmZCF
 gFtag4hHnwrR8/w5V9bTDd2OdZYvdGCqLT+pgsOo+qkK+m+9uhnZK+4lcAVDZNXtB8pm
 f/m9/biisl3qRP/SmJkT3SqvYtDqXXXQjCCi8ptMdlM4PI7e9PIqXtGGJNhTmJgzB9aI
 9n5tt8ZLjn2kdSnsdqMxSAnuwTYq+pdPRqGVz6qpo4SfIFge+xM6hcs+BziW2tUnO1Pw
 PYXRYPUPZWRt7cG1gpdTc5M2OVgO/Vpt+e59rW7e4HBnkwk5xfhlTXLCrn+vlo8ReU0T
 hWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZCROl+gLjbd8PlmqTy7uFAn3mUMnNkhd9ZvCME6hUc=;
 b=RnPsLWbJ+4H4FJ+8Vd+u3W70sH3W7KE9eP4YotOmQhwf9n8L1cAZ/UKrzn0CMzYiAo
 52uQQukbEkeXziwTM7ZPPWWWIlM+PTeLC0/vxt4DpyeLmuzLzZn2yBXMK8avV8Iwyu0A
 j3caj1c0R+nrQM5p1Otgy2nW4tYfx4qavvZui3DgPOr5VuHv4VWxbVNAfrnyuh3lo+5T
 wLz0ZUufjO6pQkDhdbgGnTWTTdLsMcXvwn69K1kLtFG+wlXvTyxiNKvtGmywShN8IjoZ
 7vM69hX8ydib5BpLwkn2nhYaF8h8MR/3DrpacDcAQMjjyeBHiSzF7hBUpj6zmtjcasEj
 1y8w==
X-Gm-Message-State: AOAM530wURLv+9rqpuxd5eoiuSlmqb5+FyMr1GNjADUNOtNvmRoBCPha
 6DDa6yQgnr5n7ZW2dw1W20m14LmB2IIJGkPDGA8dCA==
X-Google-Smtp-Source: ABdhPJxde0gTwgPGVCQ8nAuvBit3PQcVaM1qozWqgzhuB5xr/Mm3prAi7IXidKGgVMFflzqMdwmFOdl5dizXzZVgqvg=
X-Received: by 2002:aa7:c042:: with SMTP id k2mr23045628edo.104.1627335539244; 
 Mon, 26 Jul 2021 14:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <754a4adf537fa6f92b4d75d8cff8f414ea49f952.camel@samba.org>
In-Reply-To: <754a4adf537fa6f92b4d75d8cff8f414ea49f952.camel@samba.org>
Date: Mon, 26 Jul 2021 17:38:48 -0400
Message-ID: <CAB5c7xpyq=CEGgrS2ONTPaG-w9W4Dki4zcGgcKoVgfxur-Zaqg@mail.gmail.com>
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Rowland Penny <rpenny@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jul 26, 2021 at 3:17 PM Rowland Penny via samba-technical <
samba-technical@lists.samba.org> wrote:

>
> To me, that means with 'acl_xattr:ignore system acls = yes' set, the
> normal Unix 'ugo' permissions are not changed, so where does the kernel
> come in ?
>
> Rowland
>

When acl_xattr:ignore_system_acls is set to "yes", create mask parameter is
set to 666 and directory mask parameter to 777. POSIX ACLs are enforced by
kernel (that's why they also apply to other processes / local access). It
may be a problematic recommendation because it leaves filesystem access
wide open. This is why I've been working quite a bit on NFSv4 ACLs in Linux
on TrueNAS SCALE (and why they exist on FreeBSD), you can get pretty close
to 1 to 1 mapping of a security descriptor to NFSv41 ACL with the result
that permissions behave same whether access is through Samba, NFS, or local.
