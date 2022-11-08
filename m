Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DC62055F
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 01:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FvedlRkE0K7poFPRe12hH4HcfrW+0d77Kd0Ugb9xiIY=; b=fEne8POSd+bhoblJWkmz4H7nIX
	QKChg1Vk5agUyaWYEBj8Gg4NyHeSWguvkyHexnbjfOb5CiTDRMUZ3g5qBUdglCrCAgzmctbTqWX7i
	/Ky6YuDNlMIaKcKUvjip8h0nKIxyyrB/1mchhaZgyewPfzB4e7oiwQlfqFMpSpXjV+q2aLJqE0XsG
	GRUjLr5Di1qKh6CCr/zO+jxR07nwkdW3f6Ojddmul6Gxfw5BnFQsqEW2QIWHdsisfHCOOF0ZzyLCv
	2HcP+Vv8+niSOJX1rfQnKWhpdkSiZrcaHr/ZJt4cqcjSqh3vMXxxP+hjoQQNSmvX+APOhZo48UH0u
	Jp24as7g==;
Received: from ip6-localhost ([::1]:19772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osCsD-00BPyz-4N; Tue, 08 Nov 2022 00:53:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osCs6-00BPyq-Rl
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 00:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=FvedlRkE0K7poFPRe12hH4HcfrW+0d77Kd0Ugb9xiIY=; b=2cw8HEFmxNZLpe0+O5eApVXIHI
 Ec/Yr5VXGJuhAXCOC9dYrMNFfSh2ifXKqhtW6mgGZQy+v1QsI0Q2RWx5oNAZ+Q56sibW9m2t/o+sF
 1GwrmxC5Q1toLt2zYWJdS2qtwN4gAZPGHzM3g/toWtWraHL/bHBf8QdokTpKXsm3351VYlzAPv5km
 5ixMxtoEXhT8FmxlHeB7Eo6ssshEBQr0jEJZSrthTsjy38PFIyJHNaX2bT3L59RCX6owgS6ZaPRe5
 YRZ8/6iFrfFZlhYls7pkXLTY/Pjd7Ypjmns5GsEU6LXv8kG2ktc0nmgN7UY1NRl/0g2DnP6lRQ4Ap
 aKGCZCoV764/Bj7C/fSo5e8YFzbHNb0C1YBuaJBmZsqmwRmrGGLlciA/caHj+6f7FaBR1jTkSRkvA
 0qcVwWVTOEzGURrLje8yOk5duHFncwxEC5pN7eWFnNzhkMs8rCu9UBa4Q3Tx65GexWa10mppQGahw
 LxQE0Zd3+7Ol6zOxFvscUvYi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1osCs5-007cBl-Eo; Tue, 08 Nov 2022 00:53:45 +0000
Date: Mon, 7 Nov 2022 16:53:42 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2molp4pVGNO+kaw@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 07, 2022 at 06:45:38PM -0600, Steve French wrote:
>I noticed that reflink (FSCTL_DUPLICATE_EXTENTS) is not supported on
>Samba when run over XFS but is with the vfs_btrfs.
>
>I can do reflink locally on the XFS mount point, but not remotely
>unless it is BTRFS (or to Windows eg. when the share is on REFS).
>
>Any idea if there is a way to enable reflink (FSCTL_DUPLICATE_EXTENT)
>support for Samba when not running on btrfs (e.g. on xfs)?
>
>duplicate extents is needed for various Linux client features
>(especially various fallocate operations)

This is implemented in vfs_btrfs.c via:

ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);

what ioctls are used for this in XFS ?

We'd need a VFS module that implements them for XFS.

