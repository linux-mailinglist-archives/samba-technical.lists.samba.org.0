Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD7461B7C
	for <lists+samba-technical@lfdr.de>; Mon, 29 Nov 2021 17:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tf96AuO5x5gjp6koQeTaZjV3TfVhaiadm4gVY/ssPY0=; b=XWUy26H2Vw03BvLtFccgGCoN7Z
	a6fvEQrmbe+UNchfSbokIXw2C1ekSvIVRKh/a31+Z1oKx3EGRiJROzdgf1fmP6CT1zdxPKeiLyLrl
	Vov+Tpdv7ivvYmggebHc3qCBg6J+csjtlwEVZrrffDkKzkOmYsbKj3EXXhKgJF8tdsr6SgnK6vwk3
	6AYSAHg2YmPDpDL43mma4lkAHRzvUr4gxk7iUMLbDudTKkuHZ98ITOpZIPX70nU6mgC2jbKNUteY0
	cpvIcJtSMLFJM8OSKKP6BjJXCGP3MNkDrZgf+kfLIcptbonYZxaZcMFMCuoyUruVlT4s1Jbs1xGVc
	vVsFnPWA==;
Received: from ip6-localhost ([::1]:62558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mrj4y-000U8r-8R; Mon, 29 Nov 2021 16:00:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44030) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mrj4p-000U8i-JT
 for samba-technical@lists.samba.org; Mon, 29 Nov 2021 16:00:26 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 78CC640016
 for <samba-technical@lists.samba.org>; Mon, 29 Nov 2021 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638200132;
 bh=tf96AuO5x5gjp6koQeTaZjV3TfVhaiadm4gVY/ssPY0=;
 h=From:Subject:To:Cc:Message-ID:Date:MIME-Version:Content-Type;
 b=IFG+lHwQP3RkS/mSaK1drPo5kbj6CASSintGwAkI5b59bXilvaTMA6ag7fPvLTIt2
 R2+1mweyok/KPFkq9jHCAEthtd//xRbHEZVvdZg18I06W6gwLhWxR6WGoZB7Y9kagn
 nzu7EXhYNBGQ0hFBQpLrboSbh+H5pHF0/ADuZCCmT39vSnLz63YTZuWL5+7u/lDwua
 8qlVbGw/+9RdJ+LffNSGvsjey2imq39YRhBG9LXonO5CGxEXwB85AMdSAqazuELhiT
 dvNLuVqBTnaeQlfS7RpEVnU5NcPG/wWgmB8lM30q2KtqqGnjE6BB24sZj2pO8b/IEv
 rvEum9PQoh+OA==
Received: by mail-pf1-f198.google.com with SMTP id
 m16-20020a628c10000000b004a282d715b2so11007537pfd.11
 for <samba-technical@lists.samba.org>; Mon, 29 Nov 2021 07:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=tf96AuO5x5gjp6koQeTaZjV3TfVhaiadm4gVY/ssPY0=;
 b=YxILj0g5vN4RM+6Yqvo7mbDrCQxTJHOuPlVhArHqZPP4R6t1PZ31fJV3YXxNucuDcw
 Tz79b/Hr7JKDatw/sNBkjQofQsAA5NkkrKHwr3mnJzXDL5pT0a6RNVoz+m7Ms53lIfi9
 ESFGmQBZ0bsR9nMMAyC43QbgFCRG0/SDj+4P/y3D8DaY6atOROcDkIA3YPogqab4BY47
 +qAs7sq7fz+a2As+pUj6IozDkSYFHKuUvH51VsIFYAPH+TOOS3/48pMSPsLGFvxKqXil
 o2RfihDQgMSEcBgjcaY6+NddqMLuWjlGDRdy0PjRbp9LDKxIK9tROPQTC0lXL06KI6S+
 Hzxw==
X-Gm-Message-State: AOAM531nz+rzDBhRvR6fezJRvQHsLHgmdWT6Z4KVW/pL2YHK7bMeHcLI
 qAupvqrW/UlYH7K4HEtaUMtbjUsJgfces31GifTZRgtSQeFxWs3d3818GoqgEKYjB7uXhwbdOHt
 HCrPzDZpTYx7/Yxkv8keFAWwfg28qOiPnO87w7XikU5YyYA==
X-Received: by 2002:a17:90a:bf8a:: with SMTP id
 d10mr38703494pjs.67.1638200131219; 
 Mon, 29 Nov 2021 07:35:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrtghVy2cB06KZtU+MpQ0hZ+SPUtpz89k2kZUBlz6J0QLHMTxsDRgbAg5O5FYs/Nbm1imESQ==
X-Received: by 2002:a17:90a:bf8a:: with SMTP id
 d10mr38703435pjs.67.1638200130843; 
 Mon, 29 Nov 2021 07:35:30 -0800 (PST)
Received: from [192.168.1.124] ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id u30sm12251881pgo.60.2021.11.29.07.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 07:35:30 -0800 (PST)
Subject: Commit f980d055a0f858d73d9467bb0b570721bbfcdfb8 causes a regression
To: len.baker@gmx.com
Message-ID: <a8b2287b-c459-2169-fbf4-31f3065e0897@canonical.com>
Date: Mon, 29 Nov 2021 08:35:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Tim Gardner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Gardner <tim.gardner@canonical.com>
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>, pc@cjr.nz,
 jlayton@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Kamal Mostafa <Kamal.Mostafa@canonical.com>,
 stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Len,

I have a report (https://bugs.launchpad.net/bugs/1952094) that commit 
f980d055a0f858d73d9467bb0b570721bbfcdfb8 ("CIFS: Fix a potencially 
linear read overflow") causes a regression as a stable backport in a 5.4 
based kernel. I don't know if this regression exists in tip as well, or 
if it is unique to the backported environment. I suspect, given the 
content of the patch, that it is generic. As such, it has been 
backported to a number of stable releases:

linux-4.4.y.txt:0955df2d9bf4857e3e2287e3028903e6cec06c30
linux-4.9.y.txt:8878af780747f498551b7d360cae61b415798f18
linux-4.14.y.txt:20967547ffc6039f17c63a1c24eb779ee166b245
linux-4.19.y.txt:bea655491daf39f1934a71bf576bf3499092d3a4
linux-5.4.y.txt:b444064a0e0ef64491b8739a9ae05a952b5f8974
linux-5.10.y.txt:6c4857203ffa36918136756a889b12c5864bc4ad
linux-5.13.y.txt:9bffe470e9b537075345406512df01ca2188b725
linux-5.14.y.txt:c41dd61c86482ab34f6f039b13296308018fd99b

Could this be an off-by-one issue if the source string is full length ?

rtg
-- 
-----------
Tim Gardner
Canonical, Inc

