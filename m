Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 201368CF06
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 11:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Qvm1U4o1gwGVdQsmwD0I1MqJdGKeKHyrdA23LsZbwms=; b=Ni4UIdIgvJ4ooEphnkna55DbSg
	ne+lAQUwCSrKg9Q4r1F0HVK9IEPQzhX9V3yxx14O0D94nq0jiJwRQPYnWso8WpKRhS4jF+xsrhUrm
	aR4wGbrLnSlHLpdpxlkAFN1QhFE/NsB2zRF0ev4DtwpX5zjf9nQz/h+cpgUoZF9695SehSTnVaJyY
	36Vm73WWCEXC9Zx7ln4avSxBdhgScH/JDkKmJEkLq2JGrpnFvxTRkKt+2jy+hYHHBTCrI8q6qRMbE
	ibywr61ngBNZSBeJlZvEg+rgBUo7wohP4gMR5Y8o125bb02wVzMjf8ldRfb7MIdtAJtp5A3uWpjN9
	vK1X7Nnw==;
Received: from localhost ([::1]:46506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxpFC-006FbU-Po; Wed, 14 Aug 2019 09:06:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:41487) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxpF7-006FbN-Oa
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 09:06:56 +0000
Received: by mail-ot1-x32f.google.com with SMTP id o101so27740755ota.8
 for <samba-technical@lists.samba.org>; Wed, 14 Aug 2019 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qvm1U4o1gwGVdQsmwD0I1MqJdGKeKHyrdA23LsZbwms=;
 b=RRq0qUdanNElIj8JNq5TGgJ/uu/rBQS+amoYR8Dke+EtlPv4Qdys1esOaEuAllRKl3
 LHS7X6xxzSRL3HBUkO1TSTdbLPgGag53bhaFsS5XmU7sMqhYnQrShTapcHP+4rX9QiMG
 DgRJEEuOI9MjmqVHOsMAqYmLLE26sQJKlKFk9xWVtJvKq9PEqPzvfg+htv8LQ4TllLsz
 cFumx/wbE7H0X3AtgoamkJQNU1bO8IJPIxMSBkGGGI+yMPHZJikgn8yoh0+60vDOeoYF
 NiH/cqHug5F+pIjciDIyYtmraUuADznWUDxTvvVtDxvL33SAl2ZPmg2RLLs+opqUGQLk
 3KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qvm1U4o1gwGVdQsmwD0I1MqJdGKeKHyrdA23LsZbwms=;
 b=Z3fyXsdRrs6Z6kbqyICcgPX1++kYWW0zmnAlndqPGRLoj7bTurmTEusP66F9P8qUMG
 Z37S6pRG6R0Otu0LfuVkt21yM91xzoou68DzvwLMrJCM3v2h6H2Nvm/8g5gbtKqX/gdy
 qJsmD/8Y7xgd5kmTgDcEpzKZruUHxg/gtYpJhetMFNXpmHEv9rn9PlLGmXYllnsjuW/n
 RmJxzE0aSgGnnfLgvNVLb9wtQEqje2QtHj42Q3qYw4OgOLGORJXXi16W3VHJELE3RoJU
 sGaAedEbAITyFGOONF82Q3R39ugBKM5c6B9dWDE2MniOmWQpS88GO9E1TKIUZpe3RdXJ
 W2IA==
X-Gm-Message-State: APjAAAXvfaYvdOUT4e4b57Ym97ZYkHL6tkNiTP64f7MdnlR+SOmK26dx
 W6K9fV2ri98kexL/NmzhRsYNTHih8DrGqNsz5Ws=
X-Google-Smtp-Source: APXvYqwHzuAG55CmfJ5gOsO0mEokf0wpGhOvUtcsqyfXh90kIu23eqkDX2otMWbEVHf9B0dlfo/GD5drTjvPZGCRksA=
X-Received: by 2002:a9d:5a82:: with SMTP id w2mr35363225oth.240.1565773611551; 
 Wed, 14 Aug 2019 02:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190814135514.2fa64996@martins.ozlabs.org>
In-Reply-To: <20190814135514.2fa64996@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 19:06:40 +1000
Message-ID: <CAJ+X7mQT_GvWqo+++csgOTWZwDNd6+afrLatGQ3E+yqSZm76xA@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tools: Drop 'o' option from getopts command (bug
 14086)
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 1:55 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Fix for:
>
>   https://bugzilla.samba.org/show_bug.cgi?id=14086
>
> Included in pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

