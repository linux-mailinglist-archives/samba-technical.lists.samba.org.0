Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004A201AD6
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 21:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0PmLg6zJKo1N8hwdbH3T2d9y1W0Je4dOc+y14T4xu1E=; b=u9B2meym4PDL95Yunf5JQa3WJD
	5pvbAGyxLFpZT0Dzk2BI3RROex4mvGPkqhsHhJeiRvaAk8aQAahiLJQyV3NpBiyA1jiYKlFqQTKO4
	PNY/v3fhed7SvDRI0Us5pTlCAshBYpQ/BaubecwYZYhXBEHy+9ZxKfbVhuOTP4SZszerLmkj54GON
	ykHwqIHxh9Bm7/CfqDOe+emfq0njo/3Vp4gCQJdX1oTA9frs1CruJoo3V7DtFPJdMqB+QjNoS1d3L
	ZMX12TpU/37jMxAnEQR2FqaOiF4uipa0l1pvw68R4q1e7CKY0c67dxDCXxksNDQNCAjSz8DH6Ncdh
	G3QDCd6g==;
Received: from localhost ([::1]:52892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmMHI-001UNz-Qp; Fri, 19 Jun 2020 19:02:16 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:41712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmMHC-001UNs-F0
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 19:02:12 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 9so12700775ljc.8
 for <samba-technical@lists.samba.org>; Fri, 19 Jun 2020 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0PmLg6zJKo1N8hwdbH3T2d9y1W0Je4dOc+y14T4xu1E=;
 b=PmGI5cenvu5dzzfVCj3hx5Cillwue/7fbBbEK6k496KS/8I/ZeV/vKSTM1jApxiLUx
 Udji+Y/yXu/MJgR18HGyQ5hoKk4G/xJBUZt2ycbu7GoxOikXF1OvEJKTZTQZ8LcCo9xx
 uzt3lbzumQt++fnETHTWGSQq2yqWZP6vZXNNUgiSPaJ/bY+vcFRlDihDAh2WHeh3mEIr
 RSQqZI+x7xYrc0FVKDZpuhuuWf6ko1I9L7+FdXDRQ9d6FW1MwbMHV+PMncv/U4Ltr32e
 Qpv0YppF0hrdplfP7UkGrV65iwfb1raMTbVdTk2f29YvMr8SCqnr5YPHvn81rVydd9n/
 5mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0PmLg6zJKo1N8hwdbH3T2d9y1W0Je4dOc+y14T4xu1E=;
 b=boNbIqpIuL+rbjysiAjA8pkQjTcx23u+9gjjOMlTBZKrevgkgNtxaKWk+8mXE2Vt8E
 sqseeLKmFL15P7jtH25Zt9iyoQnnSl//zyNNkp/SZylMvD6NxBAf5z/6UnU4+8Wqi3U+
 0Z65qr4xUcaXfFqbYmfaubH1NxldUbS2c4qZVRVIE3lCPvI62Sqz6vHLDlBiDXnRwpX4
 mbdinV5Q4D/IPOuUbATy7nWYE6Wx+n6aS17IdR9VMPxqRhSHMXUo2DiQYvLLvCFEEeU3
 +OovL9hjjr7xLJWodMKNPMhPPYI3H31rGV4uekWYeKihniPXI4qKdFNJYH9WYYZy+4SJ
 PgtQ==
X-Gm-Message-State: AOAM531dqd2zGHrPSD84tq47oKkZpFywZXWTl0uqTxrxVaFPhqXy4qwg
 Sy0iK87PWaNU5pb5A+wsLHLjkBzySPhiTIXGSB8O6g==
X-Google-Smtp-Source: ABdhPJyea81ZJKSnkS0tzDUvU4JRoLjIC5Qn+UemWLUI/qI3MwfWnhdnAMZlgSQQMyvf9V6FK3e3ocRWW90RseyJsR0=
X-Received: by 2002:a2e:8953:: with SMTP id b19mr2671497ljk.187.1592593328848; 
 Fri, 19 Jun 2020 12:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
In-Reply-To: <20200619181956.GF10191@jeremy-acer>
Date: Fri, 19 Jun 2020 21:01:57 +0200
Message-ID: <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 19, 2020 at 8:20 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Fri, Jun 19, 2020 at 07:45:28PM +0200, Isaac Boukris via samba-technical wrote:
>
> > Does anyone have any idea on this error and why I only get it on gitlab?
>
> My guess would be differing gnutls library
> versions. Not sure how to determine what
> gnutls library version is on gitlab.

In the raw log I now see the host was "Ubuntu 18.04.4", i'll try that.

