Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D1622715
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 10:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=THb68An7mfXpt0g3Ic/C3ZXToG90RI2yCfZeF6+B/ow=; b=xOTu/YDLayTunhMkVehmsida5m
	eHKTtU78YONkNgssPT8LlBG4RjXFW4BRBFUltAEakc0FhO+7gmcGSVh8IGWuPKwr+BcdLq42a2tmT
	fR21em8+T9BckdgCMS1VyoVtPgPVmEED8QGXMTUGbNR7DMTuK23zsRvCmrtCrX/dS+1kBeXFZeSMA
	Kn1I2Uj+0guujpMQF/bWMzY9/AMksgPzFB1Fv+zlBOZKaP8JZy804BG8AA4cd1577XNLKvPkdia+2
	u11MM3036o5qClEDnVrC9q/43IZgL4FtXPjND9+XZgIrFSwP1ZE9vSgTWonXKEZ6qS8bT5cDeHroy
	FkdiDQqw==;
Received: from ip6-localhost ([::1]:37828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oshRz-00BjsR-Iv; Wed, 09 Nov 2022 09:32:51 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:35488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oshRr-00BjsI-Lz
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 09:32:48 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id k67so16058037vsk.2
 for <samba-technical@lists.samba.org>; Wed, 09 Nov 2022 01:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=THb68An7mfXpt0g3Ic/C3ZXToG90RI2yCfZeF6+B/ow=;
 b=HUGPGsm20IbfwA5GyEqowBP3i+al6ZnVpjpIXj7t75JmZOYCJ411wPpyPGq102bAIa
 C/qUw1PniqVHxGEVsHVw1M37bspjbfZ3PrnEoJOFpR5qoCCslZiiHKdjYsSMljIdgo7G
 u1VUEkQ1ADuFsJm7WqML/PVb8p/8WsmUUmU9wD9s4VKOBhEZ4HfyM6JTs3U1g2PDY5EV
 yOb802ScGQhcYs9kVL8GXRFoob0YLFwAVRC1D2bV+PNWPlxOGD7uXbSLr4iRiIvpSRo4
 QdO5gOX0kfWWHvq0xrnUOmGIZAuJ1i52GLVCt/RB/CCf5A5zQIMGCJ0A4komqef71U/l
 zidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THb68An7mfXpt0g3Ic/C3ZXToG90RI2yCfZeF6+B/ow=;
 b=gNvLCJbtCWO+h6AasjoeHT2xUq3URmx4fUK4oxMdZOH4puhAp/q9PSsym3jMPaJuTN
 f/lWvPH/Tk7MTME/f9OqD69qlmyeMGnGunc8aqT2Zo+SeoikmVNSjUVK768CGU07fOuQ
 tjfOVY9klsiw/Pp6gvhk/emSZAFO6IpfyPaZdKTBQTGQzfv3Q0hkkLG9sEy4hrhJAhVS
 e+wxIfcL1/B0JzVGy8yq1dCmeI7+Ob/35rBNDd68rTkKEQVcivZuQZs30oBfX/K8jyE/
 rBUszq06XnoNOe4FGRVbkHG8DuYPNLk6On7eQvqmmAnA0gGlt+Z/hI8vbdrP2P9yqieD
 h3jQ==
X-Gm-Message-State: ACrzQf2B+IQ5zmuVY3w8ktDsKFAqBPRcnhkUJrtX01YghFqoHOhPcoao
 /wKPs/DdIgyLbpTm4W5DLbKRyOWS1RlCbuR6Jtk=
X-Google-Smtp-Source: AMsMyM5LH22jLKQC76s3HOT5UdE9nLihj8jTFUKP5CrdBli9QohEuz15EJhSCagrQWFXtVnGQ4PuN9Z5Thu2oC56JuI=
X-Received: by 2002:a67:c990:0:b0:3aa:320a:90a7 with SMTP id
 y16-20020a67c990000000b003aa320a90a7mr982645vsk.3.1667986361406; Wed, 09 Nov
 2022 01:32:41 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
In-Reply-To: <Y2qXLNM5xvxZHuLQ@jeremy-acer>
Date: Wed, 9 Nov 2022 11:32:30 +0200
Message-ID: <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
Subject: Re: reflink support and Samba running over XFS
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 8, 2022 at 7:53 PM Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Mon, Nov 07, 2022 at 10:47:48PM -0800, Christoph Hellwig wrote:
> >On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
> >> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
> >>
> >> what ioctls are used for this in XFS ?
> >>
> >> We'd need a VFS module that implements them for XFS.
> >
> >That ioctl is now implemented in the Linux VFS and supported by btrfs,
> >ocfs2, xfs, nfs (v4.2), cifs and overlayfs.
>
> I'm assuming it's this:
>
> https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html
>
> Yeah ? I'll write some test code and see if I can get it
> into the vfs_default code.
>

Looks like this was already discussed during the work on generic
implementation of FSCTL_SRV_COPYCHUNK:
https://bugzilla.samba.org/show_bug.cgi?id=12033#c3

Forgotten?
Left for later?

Thanks,
Amir.

