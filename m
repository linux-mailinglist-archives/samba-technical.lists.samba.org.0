Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4845A6117
	for <lists+samba-technical@lfdr.de>; Tue, 30 Aug 2022 12:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KRp01oZfJFm6ILCgWA5QXfLM3Bth9pOxgctimQX+jlg=; b=eijBuBvyRAAt1t2hw/qOH0vq7a
	E+QxlzwU4h4VX7HWvIZRUhyd0S+ndaHQclu8tCRlZDZRsqzcIrT9n1kcEEwBo3QC9xOIapYiKAjh0
	rC0xexiMlMS0Zd1GvB0aem+/4dYJKLLhFtGUco8N4XcRliVMnK/Vacjb+DH0fLKcSRiEUshJPsf5G
	6/FBPn9JZKj1Ar9CiWYJPDE2VT/uSmqNYo4/1EGWXevHRu66XpMMoTHV9C5uJVzwZMUsnBXXW7oMC
	TvSiBVRfP3tZnZJvcCjt9moWEdJVTljys3a0XsICotbzwp+FbNg/ZGldJWB5ZwxlhTutDIL/al2av
	grbrLZYw==;
Received: from ip6-localhost ([::1]:60744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSynL-0031KS-Ag; Tue, 30 Aug 2022 10:48:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSynG-0031KJ-M9
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 10:48:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso4290217wmq.1
 for <samba-technical@lists.samba.org>; Tue, 30 Aug 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1ogIRRm0UJ0mklN2iJnheUzfs5qW5ZCNmWDB2nKapJQ=;
 b=RFOi/DF1lkB97Ofn9aZZwB4BCnVou2JwN/6kfE9TJae1ZO1DVluj+XN/gI3MJxonUC
 os6uXfk7iP8O5oe+tDgsNMuKOg2sw/9PqeDQVfZBG3Nc5FCvkqRZUvhFYb7D8qDtcthd
 TrL76I8B7Ph9KA1yP91d7xAXkdWAgfm7U/BF1KVL1TZqBmPGwR+q0d0N7dgeK/mageg1
 IYVkM3JvB3FHhNYyofaHHP3UUMB1oarYhgpE0VrP6bcakTgrGq6+T8a5addh+d3EGpN3
 6GzqEeOJ3NtlsXtOCfqUcxR9BuFxjYODyhK7yrZCC7yLgSy+s6wMxK4asW5mLrHSB0Wj
 t4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1ogIRRm0UJ0mklN2iJnheUzfs5qW5ZCNmWDB2nKapJQ=;
 b=PXzsTAOTAsYL00vwWkqLzs3kKZW/JrNS67cAafgRPpaVw33C+ytbFeYgZlTsKlNYTy
 l3r3JqXx3db5xZOFq8mG/122eKjrEUlN3CpL63d0Sypdp3Irp5UewiNnCMbILfJl6zsh
 VY+hfeB67V+1zpwbEWuH420m8stppdRbtikmkqROu3XU01xm10Qaheb18DLa3rfFDYsZ
 VgmLSQYm8so5ywi1hGWcXJWcFen3nPY2a0fVe9TI3/l+HU6CzhKIVfPYPS8rB3pWpKwD
 ImrZbVoA9N44u4TwXoY+SlBHJKa5mAZy9tSpFE6zzM2Yov32NxEsE3cIDbqL8gKWWL8+
 OjbQ==
X-Gm-Message-State: ACgBeo3EHTTqpbQ0abOQNAm3l2VUBj3Su41Ns26nT9GVxQXiGlBqvUNV
 qkFb57fXw6AOcYHAyO2hplbY23t7QBDo5FZuE3VawXQgp9g=
X-Google-Smtp-Source: AA6agR7va7P4P0DZ+Gn0K3TSh6LcPLkpjRJ4EPx8zVjcCjE11w5U2n36mRbXLinjoAiqk6sr0990feBVW5r3CIyXfJM=
X-Received: by 2002:a05:600c:3516:b0:3a5:c28a:f01d with SMTP id
 h22-20020a05600c351600b003a5c28af01dmr9683566wmq.165.1661856501686; Tue, 30
 Aug 2022 03:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
 <012ee9705f94cb2b06bd891106fbfc2d15478c47.camel@samba.org>
In-Reply-To: <012ee9705f94cb2b06bd891106fbfc2d15478c47.camel@samba.org>
Date: Tue, 30 Aug 2022 06:48:10 -0400
Message-ID: <CAB5c7xrnuL2-5uCE_8ZYRYZPtNZoksnZWTHfLO0=vasc440MSQ@mail.gmail.com>
Subject: Re: Samba 4.17.0rc3 opens via vfs_glusterfs fail
To: Anoop C S <anoopcs@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 30, 2022 at 3:59 AM Anoop C S via samba-technical <
samba-technical@lists.samba.org> wrote:

> This was an issue with glfs_open() and is now already fixed[1]. I hope
> you were having a released version of GlusterFS installed in which the
> fix is not yet available and must have encountered the problem. I'll
> try to see if backports can be made available.
>
> [1] https://github.com/gluster/glusterfs/pull/3307
>
> Thanks,
> Anoop C S.
>

Correct. I was using glusterfs 10.2 (latest release) via debian. I see the
next minor release for
glusterfs (10.3) is not scheduled until November 15th, and so we may have
some gap between
when Samba 4.17 is released and a version of glusterfs that works with it
is released.

Andrew
