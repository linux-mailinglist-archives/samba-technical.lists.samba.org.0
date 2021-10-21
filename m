Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CB436864
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 18:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lln41lvjYnXHVLIBBOwdLiErTxjUWiZ9mCrrPsUp9B4=; b=130ts8j8On0Sj3R328LuLTloGz
	k2oFz6NSzrQ4k72NoYqQ2H2tFHWXxLiUB5zXglkIILgv3jyqogkCgiJnJGrhemkFtrtmtrLiBinf8
	qXSn6l8ZoijV8jea00U+6msDv0+HGSasdCnPoNQZ7rtnCb6wrmnmpOJ99jptqn5tS8pO/Y6bDqQtr
	czMXH5XeWkAB6cowC1bC1lIKh1e9c1Pbd+KL4CTK1Wki7sXCq9g+1BQYxEscci3/Ic1B3+NB3okN6
	m3s3npdKX1QES0FFZ6t1dMwphudbaVYHRFo/FuntXlECv3VLQtn/ClZY6PXG7DFLtJnmyCPHZO54S
	eZBV16wg==;
Received: from ip6-localhost ([::1]:58666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdbJv-00AyNc-7O; Thu, 21 Oct 2021 16:53:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30808) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mdbJo-00AyKX-6x
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 16:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekUm+Q+Od1SAT07pJ+5tgJ32DQYt9coPWj3pvZFT2cg=;
 b=aXsXNCY54P2uTgJMrtAZdbuAbYC7fRPfG9GAL+1QOx0ONKj6hte6rqgT0ohXEl4GS8rxIx
 kFBMgi4QRrdWwcLheLACJHBIng/V0l/lr+tCDKavPtAzHzqcuuTP3Glqu70BpSkKNCHtDg
 lykHcaeqdHxcoN3Cbz6Ub1Zg2ZBM+os=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekUm+Q+Od1SAT07pJ+5tgJ32DQYt9coPWj3pvZFT2cg=;
 b=Tdn3PsPJAQvG8Gf2rr8IK1OTA7q/4xJ1+CwHWAD0O9km6zVBm9cmZkK4hLgwblzozOZneS
 zQUeV1X+7wMLOv6idT8Ld035NPa0lqPRWOt+dZBb0u8EH5B3y3KUQACe7+r0B4Tgx1bBFN
 kl97kqmCXOa6S/ZWRGlOpfV9KuDJff8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-3ZonfJGbNiqWmrFMGOyMrQ-1; Thu, 21 Oct 2021 12:37:33 -0400
X-MC-Unique: 3ZonfJGbNiqWmrFMGOyMrQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 y3-20020a170902d64300b0013fc50eb97eso431973plh.17
 for <samba-technical@lists.samba.org>; Thu, 21 Oct 2021 09:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ekUm+Q+Od1SAT07pJ+5tgJ32DQYt9coPWj3pvZFT2cg=;
 b=xLQdI0YTRF3famFpHqOCAn/nUeWYBj5WHaxXgxGndDqhDvLRuK9/qa53tGM5tToH7N
 N3N+1GtD6VAovbSqMQwn5jQpndu/FldG6LCt9b8CrkA/Ejnb9zjTEGAcfIf6yvy6TNsO
 IXLHgKM5cvsTpxitGTgvscWXM3O6WzSL9bXouJPjQyAuFb8P4SUAfQGWB4Yc0xB2kEjC
 izFYipK++DkexhHfNyAlJcP9e3xnhuni+OWVHkRZfUIVu9cI04jiYfBIbWkQIjV4Oyfr
 dYzsKZ9vP/mbfAYBuvkdRJky6Y0GOW8S2fy3ktfdcKcLIjKGRsrIjFuCevDNb9FRZd/d
 hUbg==
X-Gm-Message-State: AOAM531Pmk487HzscdVKhg87IVR0By77mTnKZvsGkfoRWD0RPBp8Y/Zx
 iJKqh8wURAk79kG/i6QJag06UMu9toJS90ggILyzsrq2mrqdmEAp4EcBkK+QR2Nvz5Xu2li16ky
 W4uUahpwgwB/hD10sgm6rcfDm/Ql+/a3cYhNBcGcKjUL6
X-Received: by 2002:a17:90a:af93:: with SMTP id
 w19mr8165250pjq.10.1634834252172; 
 Thu, 21 Oct 2021 09:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymkE/XaOCklwRJullhNBPzIVTVeM29LLeGlEN0jCWA4gdB6uQQFMplB+e9KOUkquD1hsOHIbwRD9sY/N3VxYA=
X-Received: by 2002:a17:90a:af93:: with SMTP id
 w19mr8165217pjq.10.1634834251886; 
 Thu, 21 Oct 2021 09:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
In-Reply-To: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
Date: Thu, 21 Oct 2021 18:37:21 +0200
Message-ID: <CAEcb10sPfDuEnBLUC08vhsQz9j7tUfDqU0XScw+pr-R6SZVuvw@mail.gmail.com>
Subject: Re: directory with a symlink pointing to non-existing file
To: samba-technical@lists.samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

- but SMB does *not *allow to delete such *empty* directory, it gives
NT_STATUS_DIRECTORY_NOT_EMPTY



On Thu, Oct 21, 2021 at 6:35 PM Pavel Filipensky <pfilipen@redhat.com>
wrote:

> Hi,
>
> if on local linux file system there is a directory with only one file - a
> symlink pointing to a non-existing file then:
> - from SMB point of view the directory is *empty*, such symlink is not
> shown
> - but SMB does allow to delete such *empty* directory, it gives
> NT_STATUS_DIRECTORY_NOT_EMPTY
>
> This is seen with samba 4.10 and 4.13. Could there be a difference with
> the latest samba?
>
> setting those smb.conf params has no effect:
>
> allow insecure wide links = yes
> unix extensions = no
> follow symlinks = yes
> wide links = yes
>
>
> How to approach it? I can imagine these:
>
> 1.  Do nothing. A symlink pointing to a non-existing file was created
> without involving SMB, so we should not blame SMB and instead make sure
> that such behind the scene manipulations do not happen...
>
> 2. Implement fix to allow deletion of directory which contains only
> pointing-to-nowhere symlinks
>
> 3. Implement fix that puts also pointing-to-nowhere symlinks to directory
> listing
>
> 4. Provide better info when deletion of* empty *dir fails with
> NT_STATUS_DIRECTORY_NOT_EMPTY. How?
>
>
> Cheers,
> Pavel
>
> P.S. There is a related BUG:
> https://bugzilla.samba.org/show_bug.cgi?id=5209
>
>
