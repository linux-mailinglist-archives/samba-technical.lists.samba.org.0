Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA991F7E88
	for <lists+samba-technical@lfdr.de>; Fri, 12 Jun 2020 23:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4vZANPVCJEf5Y7bpYnubObVh7LsONAYBllF0H+T8JXo=; b=qjsvvl72iRJkiUj5QE0AleKkGq
	RCM3DWBMdc7geIGdW4Ic/0enYyjDwAw2Cgy5pfQOwtCvF7j+wERoiDF67k0OmyKV0B+CYTtR5NONG
	HM22x+zkix1+cHrj0MampX1Lhduu5XnYZS/CNVsp+QyrHqKieJeDijm2VJOCrhewRTVTsA4fJ527X
	FO2XaVHy6cULd0CT5YevSCZdtvdJHNHGrtkwuUmjhM3kxQLz2KtRJ7YviqhxVhHrx2bfetzqsvVlg
	Oc3HOii2yzc3ZpcGKexcgwk0qAczf8OzoQXJSp+s2SYLJzPfGBkaucQVq9bTcJMbd5VYBzU9Dlbaw
	8EFNhCbw==;
Received: from localhost ([::1]:28748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jjrbf-000AwI-Sc; Fri, 12 Jun 2020 21:52:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44880) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjrbL-000AwB-S3
 for samba-technical@lists.samba.org; Fri, 12 Jun 2020 21:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4vZANPVCJEf5Y7bpYnubObVh7LsONAYBllF0H+T8JXo=; b=V+6NHy/TdEoCYbCkXRBRbYdcuf
 276vnqh+LpkM2Q2zWzVAuOEZKNr4VTVaLOAN8Oq4YrKMbSxkYn1Wuvsn3m1UCfPJoQBNp4Rog3Oaf
 F+vb9fBcmGtb+fls/C7eKRPEUCoDiCeejZSL2HaNJYSZDIzpbIZXwqN+/u5rSXDx4+mRNAi+yZc53
 Vy4ME89BUlmdFRljFpYg6PJwCiyrEGjrYkfVK5bQOnqQNVDQZ537nOY4C7wTFsdES0lpxZtdIkI/A
 va4TNkcldPG3b9jZL4aftqadLUxs7qrwlev7XYxaWQLfjN+hv46tJHMyQbWLh+JniNfV+Mb+sqoDU
 cZTZhFk+HoAkiVAgPtKaNK9ecYWiXrL3ZiDWsfKyJ8DZQngJ+a6EFWMwyadGOthogPU0s7gpWi2GM
 7s/+25D8hNZC5UjTFGjFnPqM+YzTukuvZdH89zjf/65G00ibWZjQMbbKZXsl9U1Y/pWveMfSneJeU
 K4vwbqQqmgaRAJLwWbCbGSRb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjrbK-0003Nw-T7; Fri, 12 Jun 2020 21:52:39 +0000
Date: Fri, 12 Jun 2020 14:52:33 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020: Week 1 and Week 2 Progress
Message-ID: <20200612215233.GC21540@jeremy-acer>
References: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
 <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Jun 11, 2020 at 10:34:44AM +0300, hezekiah maina via samba-technical wrote:
> Sorry I didn't to give the link to the repo:
> Here it is: https://gitlab.com/HezekiahM/samba-ad-dc

Thanks for the updates hezekiah !

