Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C84C6CB
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 07:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=975n1pRlZvHWVrvlkCM9JYyTq8SwMn3AiFj33aMVVOw=; b=DEYtoRyektaJxioS9DC+2UIJCS
	5bLDuA4HpHMBmnDw1BZKFUqCBDw7ShS9PKsjj/tpt2jTwrOMWU/1TGGbMCX6XV8EEI6WefZxs9fo3
	6exOmGskrqKZ8RYXu4vdGI1SQaOmwXdIS1SN+LPG9wi1TLCwobV1YWX26dP6V/XX+xQWRav7mnFhe
	94EyrByNK/FJ4OqScYaO/GkdG4GQvet/HV72E1q45a9IP5KVyRa1Oi4lu0mnmH+YmW27UFR+kUEJb
	ktdku5nW43PlvEbWNF0Z2GY9bvz5jqIgsKlBAck5NvUA4kkqaHungpEhFLbNJwncAS8c/H9gC1uYV
	Wu6aYsKw==;
Received: from localhost ([::1]:50656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdpd1-000atO-6f; Thu, 20 Jun 2019 05:28:55 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:43194) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdpcw-000atH-UX
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 05:28:53 +0000
Received: by mail-yw1-xc44.google.com with SMTP id t2so631908ywe.10
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 22:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=975n1pRlZvHWVrvlkCM9JYyTq8SwMn3AiFj33aMVVOw=;
 b=vej6/UOM56QFAi4RyCek7x+FHM10VJXhjV/yBMJfwJ/eLHPl/9xBs6cjl3YT0ZR13b
 aLvZKSyg9FIFJ9XFUBMDs5FqqLuaCi6s+POOE+WWpxjo1V617a5seaK8iL+wKpEdb/tK
 wakna1lltAvzWri0DuT0nSEomO1/NOc41gFdYhQPTgCuajhMt7t9Umcnh/SP3aSG1VOy
 o1wbGss0XoZpSb5ygcqJSa7lkutA0d14zDv7LLlbSZVd2YTjiGUt2R8oIWy5BPCmaDew
 bmxSGV8z5XsBfXo55pM6kktBgRr19wB8GVY+XFwtsIVjd8MgNdzDpFZd5yKIFo+vdViy
 55HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=975n1pRlZvHWVrvlkCM9JYyTq8SwMn3AiFj33aMVVOw=;
 b=SwgwSqlGMcYrQFAQ+SwbgvZ90v1/URmMKi2L1OTj6lJ2cQVovwNCXtLcPXiWPkyFNq
 YFFs0h4RPXAz3zpH+4unwXuNE3nRImmmZxitH+Gzpzh6in2fzhRp128ILpI6/06ydFn2
 oUGMSno4ggfba5M1+tvv+AqsO9nRBf5vsrkMOv3f1TM33xLQGvoUMNt9e8cqoj424nC3
 G+/VpCGjYeSzUJtRRtT2Z420AZ8pE7m++3jKarVKsZ7AirVkPgsCy4ld1RB9JaXGtG1s
 pJXMNjjM9v4pHjV9JTQoJqtCiDwmUF1bOxSfmY8Zrzt4WKX8b61YZ6y9gKpjEFUMz2BB
 27+w==
X-Gm-Message-State: APjAAAWdglNQf6p41hplJb7K0snUG9nxmB3SVMDk9TVG2La8uYcTFytc
 AukB+er5WXyr3esT6QHTh4TK+b0KjLWSWPFjrVgSrA==
X-Google-Smtp-Source: APXvYqyc/TU+xc17P9uKRN/o3l801PdGZD7XU2NmiikDAEG+lkR5IHdIyZnss8a9qeKHKIpBeaJc2SwfWgFhaSSjr4o=
X-Received: by 2002:a81:50d5:: with SMTP id
 e204mr18579529ywb.379.1561008529213; 
 Wed, 19 Jun 2019 22:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
Date: Thu, 20 Jun 2019 08:28:37 +0300
Message-ID: <CAOQ4uxhC9x-quL0O9CYaqQ6_uX3yW_3PgW=a68AJboB4pjqz1w@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 20, 2019 at 4:44 AM Steve French <smfrench@gmail.com> wrote:
>
> Patch attached fixes the case where copy_file_range over an SMB3 mount
> tries to go beyond the end of file of the source file.  This fixes
> xfstests generic/430 and generic/431
>
> Amir's patches had added a similar change in the VFS layer...

BTW, Steve, do you intend to pull Darrick's copy-file-range-fixes
branch for 5.3 and add the extra cifs "file_modified" patch?

Thanks,
Amir.

