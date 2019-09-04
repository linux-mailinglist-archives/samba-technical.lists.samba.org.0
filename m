Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5BCA7F72
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 11:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=55WwKcB7jP4QU2+zG/uAInlOJpAUJFil3XnzEpEera0=; b=SeEqw5Iqn3pglrZL3Jrxk4QzNU
	WFaNzrbiiwnMYMkOp8+M+RD0gzsb6kaFv2X2y/afdn5Ez+qXKS8xuq5YYckWm/2zKfwa7rtxoj2Au
	Wrjmr7J47zUetkYk/kZr5MZ4eYXRMp/8rAMU8FS0G/UdJud+zayaV5zAq9T3QX7OTZbLcmkQOD3eN
	Cqsz7sASisGeRH6iH+CIbN7LKwN4IR46qtiXTO1B161hcBydiiFfXNrvlrsPEPr4WdLF/6uToCWlR
	dNamGULcgLimNvzYdhSqqSY/1TZ6uMlnvdFm/zsXeq7g8GDRlfTcTQHqZfmdL0AsFsWMVTxaMm7mg
	tabkBynA==;
Received: from localhost ([::1]:47212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5ReB-003M7N-Di; Wed, 04 Sep 2019 09:32:15 +0000
Received: from mx1.redhat.com ([209.132.183.28]:35782) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i5RdY-003M7G-RU
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 09:32:14 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8AC0F2A09A4
 for <samba-technical@lists.samba.org>; Wed,  4 Sep 2019 09:31:32 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id s24so10853406edx.6
 for <samba-technical@lists.samba.org>; Wed, 04 Sep 2019 02:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55WwKcB7jP4QU2+zG/uAInlOJpAUJFil3XnzEpEera0=;
 b=l2wEjsG9Dzw7mBjCujPCOlXWMP2i5HYbKfyuOue5yV5ATnEUrPJNsd5lmypdGrO2Qz
 2D817scQ1K/HtXE9fSW0pghiN2lpOTaptAilM5VL9hOG4fKiMekeBMUIeck4utij/2xZ
 MZaB5OEjbtoMDZYIyzRTLy9TfJb7z8kEM2hb1K3ovUAETsWCa4RggMfl5AmAeZu1nGQv
 YGlCssTuhYiXLKZGf9ebLRW/gTnoYNsFQiPQeAR3DWfHwm/SjacnWKUOh558umExl7hr
 i2yyabxjKINU8dwZ8B2UHf273dEPz7Uh/CnNfZYzY1/AppnO6llCSMDtsw8XcaDEjf6Q
 rhvQ==
X-Gm-Message-State: APjAAAXEgwCf5eyzpagkwgj6aKEKhHlR/tOBCzZ6HCwKZsGbG6Kmjd82
 cNTBUBnRucBQkAoUxAWI3H6ChX/WLMjS/qYTh/gzrDngidQhS7h6+K2vkSXOWWjuresRIDD13wA
 baJzXyVuF0zSkVjiwCsbmHPSKs0SgIpP5crbo3KUgL8Xg
X-Received: by 2002:a17:906:30c7:: with SMTP id
 b7mr32094848ejb.132.1567589491282; 
 Wed, 04 Sep 2019 02:31:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWGwjvPc20h9JcEW6BusZOe1XpyZ3f3j2yXPm3V4F5rEpvAPdSfvBMPm5pC7Ba+DJzSGaXfggoQpz+M6ZcUj0=
X-Received: by 2002:a17:906:30c7:: with SMTP id
 b7mr32094837ejb.132.1567589491116; 
 Wed, 04 Sep 2019 02:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAEiGmBL_1J4CBtKRcqx8JpSMTpMKFA6L6kBYpYYGsdXRXsfPaQ@mail.gmail.com>
 <9b8897329db688e6b8904f636131922fc777c318.camel@samba.org>
In-Reply-To: <9b8897329db688e6b8904f636131922fc777c318.camel@samba.org>
Date: Wed, 4 Sep 2019 11:31:19 +0200
Message-ID: <CAEiGmBK-sRqnTT1myYMgj67q-Em_hPkUMC54azk4SiM1Yb75PQ@mail.gmail.com>
Subject: Re: Test script test_net_ads.sh can't fail
To: Andrew Bartlett <abartlet@samba.org>
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
Reply-To: Isaac Boukris <iboukris@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 4, 2019 at 9:46 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Wed, 2019-09-04 at 09:20 +0200, Isaac Boukris via samba-technical
> wrote:
> > Hi,
> >
> > I've submitted wip MR #765 and while working on a test, I realized it
> > doesn't fail when it should, right after the first call to testit(),
> > see:
> > https://gitlab.com/samba-team/samba/merge_requests/765/diffs?commit_id=28f588b18c2f13c217d958914d8cbcc0c4a7368b
> >
> > Any clues on this?
>
> Failures in Samba tests are from the failure: lines not the exit
> status.

Ah, I thought it was the exit status, the real bug was actually solved
when I switched to testit_grep.. all ok now.

Thank you

