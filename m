Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 124791C535D
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 12:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=H1X9o5TMgQKkVr35gABq8n1ZG/GcNZOmmcAWooEKzSw=; b=W2fy1FBa0qPkKEic4X9en743IO
	crKqIrYvlOnKP4Gjk7J9qX7l2fo7SwNxmMOuu3PJzWlKxTIaaIFJgtws3oPjvcTpDd5Aka/0Iyg18
	WB7naWysOiRclhRtHFdhfaz3JSOb0vRDmsEqyhQSMS4F6I/JyDy4nlsS2cIr8+6e3c7q40diGPtjX
	HgOneJMTMEEuYxWz6xI27kA9ma1EEvl5p/RXLTqZEBgYIhu86jkQ9EkSGWgwCyYIX4hLc7Q+Ml4Hs
	c5kI45Yq8bHLRohbXYgU/+erKTFxAugX1DiVIM2ADs0Qh1erDmXdWu03GJiiLCLiZU400ct13FNVh
	P/b5j/QA==;
Received: from localhost ([::1]:18460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVuuw-002m5p-Mc; Tue, 05 May 2020 10:35:14 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuul-002m5d-V0
 for samba-technical@lists.samba.org; Tue, 05 May 2020 10:35:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id re23so1263246ejb.4
 for <samba-technical@lists.samba.org>; Tue, 05 May 2020 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MpxDth9Vdb5DJrSdvyIUuTiId74ZPC2cTAyc9CvMNKo=;
 b=nC31+3Dty4DHhKGza88LuJ53Yum7dRw8drdQznCQKEG+FX3b1d3BehALlNOyERe7Pc
 3yvAtmXkMZfgjz/OHCZnOasTduy6ZJaCCTx/1eFhiFRVfBQMjM6ndHjENlxzr8NaX4MX
 /Ih2PtR2Srr86Qzdhjfc38Lq1A3n4hYy4soTj5w3NLHJ85uRtS96EFpbc9xy59tuQLYQ
 //obi+5/8RuMnsc8PgJXQzsfWybRlm6aCJ55Sr7G+tC0aThnTLTlIEEEE4DJaWdE9j+Q
 phaI3/Pg0zoye+EkCa0XItVyGxK9vza3TzFyuCn+0jVpFUGFvhjASC54awmKlxKDJ+qH
 n9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MpxDth9Vdb5DJrSdvyIUuTiId74ZPC2cTAyc9CvMNKo=;
 b=sRKbjTPKsBLchAcFdGiVKC9B54ilywJ/jdgPHL9rqWrdNPPYZgVwIxnviEdXT0Zpjd
 whOyW0d/PA5RAl04TBPjk2H7vvzVVjxmxJSD71Drs9zXjXFYjh7rC5rhTLpuxnpF9fFc
 Vu1YF3pF/m6Ez45BTTREMnoMn/lsTRGoDWke7rENPr9b4tXUVQBb+t+jaAX2mGBeUTgx
 iXsgqym85o1rR47SHbO5BfPOv/jVmWFwS4x7gZ1lh1hLEoNFbpOsPvXvEPY2K0QHvsOs
 LjJ87w27k0izjXtuFjzDog48mONRsD0jeyt45tqEbgBsKyMB3Ven9MvSwoWJWiMXlBUw
 kflw==
X-Gm-Message-State: AGi0PubJgV6bNeshOlcjQ6uWp9W7QT9ozvcNAB5skiIMNuYDpuSAd9sA
 xaneCnbkfMEuSMr/GKwFGC6usax8lozIyO6A/xE2/4KR
X-Google-Smtp-Source: APiQypK+7LJ08xWi/JuwXY8fKCLO6ASawKJOTg5Cuv2qQ5eMQ3mX8HmWfzP3aPHBVjlL6gIfOPcJlBrZN+Huy+KTLls=
X-Received: by 2002:a17:906:7f01:: with SMTP id
 d1mr1944192ejr.49.1588674900230; 
 Tue, 05 May 2020 03:35:00 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 May 2020 13:30:25 +0300
Message-ID: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
Subject: GSoC 2020 Community Bonding Outline
To: samba-technical@lists.samba.org
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone, my name is Hezekiah. I have been selected to work with
Samba during this year's GSoC. I'm excited to work with everyone in the
community during the entire GSoC period and become an active committer
after it's over. During the community bonding phase I'm hoping to engage
with the community members, getting to know the history of Samba, how
different people contribute, which projects the organisation works on and
possibly contribute few patches before the coding phase begins. Any
resources from the community aimed at onboarding new members would be
greatly appreciated. Looking forward to working with you all.
