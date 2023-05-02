Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAEB6F3D3B
	for <lists+samba-technical@lfdr.de>; Tue,  2 May 2023 08:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=L5ZB4XzWn5L2O/gUmlO1lha1p9XXtRUuw21Lz1AZ3a8=; b=Q+JUxk3HLnuSUbCFcwZbLsqVTE
	hOfspGz0GJ9V80+KxOajZjA0VByzPlnT/F+VSJGjI3nCWct9PcRgTmhTtxwX8TN79POg6NprN1THG
	yOcMFuypQHRrbp2m1IYgfaP2OxnKjCbJHx4Qn5oIWvn3WtqtKYTrUCi91cnqa7Vmg913CmwE/oVQ/
	YPNBWh6M6juBb8vnbND5QoFWi+itdW/9a4v1fhOsWvyE2FQy78ULIRX/z+iEisOioJi+Z8oAAFFcm
	eM5YLHI+iKKQGKhOHYM7V1Mdj57jO8SLA2DDdNzYoZ7JY8TL0yWNGgaj9pNmG515ViJ0NK+zIXk4S
	ji6KiOqw==;
Received: from ip6-localhost ([::1]:52216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ptjG2-00810M-Vo; Tue, 02 May 2023 06:13:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:41546) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ptjFx-0080zc-LX
 for samba-technical@lists.samba.org; Tue, 02 May 2023 06:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DFFE61830
 for <samba-technical@lists.samba.org>; Tue,  2 May 2023 05:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37CDC433D2
 for <samba-technical@lists.samba.org>; Tue,  2 May 2023 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683006966;
 bh=f6Fl2Ulp68fTeYXWhgX22P1f6deucPhQ1pDjoHJSGzw=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=WH9C/ViNwXbidTdJPEj8UAHu6lmrZCFMgSJ8HtJlL3ruBasH4m8IFDsR/o41lWhpa
 UAPwdG7uioj8lMx2/IakyNs03GrQVaXE2JvPG1XidZFRcixhQRlox6D4p+2yDd4vLD
 Pum80l0iJti300cpqSkEYFG3XpiUQ08QVo8AjanJ6/cfcwNcBVRb+ac2l/pI7XFaTv
 Co3dJlYNnWw4LbgLvyrGckYICjJXpdQ6rUcKcv9jPzqdbGvmsc9Q2iBudSN75gKOoO
 qV9NfCoKibk6MYGxY+zZWPpqfECzEMl4mCtj6BJHab1Noa69bJUahPe226BdUHU+zn
 UeQSubOlOcI5Q==
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-546dad86345so2527668eaf.0
 for <samba-technical@lists.samba.org>; Mon, 01 May 2023 22:56:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDx9FBzImJulprmDgIIOsuYWhiqkumFNzLZHBCjG2lPjZafXzxSk
 ljKT2bASwshEZygiODwvclroiXnwSv/1dmJdrPw=
X-Google-Smtp-Source: ACHHUZ5/bpbZ4Z8XoI0A/j81DWHIECIYiqyXxdKq043gIUtCyh+j53qTQc0MZqigQuqFVuB7R7bwIMsXP6AUIzo/g6M=
X-Received: by 2002:a4a:ea8f:0:b0:524:a1a9:f2b3 with SMTP id
 r15-20020a4aea8f000000b00524a1a9f2b3mr7413827ooh.8.1683006965202; Mon, 01 May
 2023 22:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1086:0:b0:4d3:d9bf:b562 with HTTP; Mon, 1 May 2023
 22:56:04 -0700 (PDT)
In-Reply-To: <CAH2r5msNirMEVz=B8fmZ83r7AwsMcM6hd+vSFcsVSB_=mHWHsA@mail.gmail.com>
References: <CAH2r5msNirMEVz=B8fmZ83r7AwsMcM6hd+vSFcsVSB_=mHWHsA@mail.gmail.com>
Date: Tue, 2 May 2023 14:56:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_n5F25rhVRFo0zFe0pZ2JYPqYHombDKhPASG7dMxW7Ww@mail.gmail.com>
Message-ID: <CAKYAXd_n5F25rhVRFo0zFe0pZ2JYPqYHombDKhPASG7dMxW7Ww@mail.gmail.com>
Subject: Re: [PATCH][SMB3] correct definitions for app instance open contexts
To: Steve French <smfrench@gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2023-05-01 12:26 GMT+09:00, Steve French <smfrench@gmail.com>:
> The name length was wrong for the structs:
>
>          SMB2_CREATE_APP_INSTANCE_ID
>          SMB2_CREATE_APP_INSTANCE_VERSION
>
> See attached.  Also moves these definitions to common code
> (fs/smbfs_common)
Looks good to me!
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!
>
> --
> Thanks,
>
> Steve
>

