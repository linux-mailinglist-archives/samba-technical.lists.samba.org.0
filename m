Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D3382D12
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 15:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nuNGJ1Fk4wwm2BqMc6DP9ZbmlZYU4eb4xldbDbcTWnM=; b=ENaxSOSdSXET0CVNZvgfR/ymmz
	6rB23rkaHU8UmuqcF5i00PvMh1qH2jdmumoCqo1wVhZxmUi07fUXR04iWGzYmjokpZXx1y+weFpfC
	jB0Hg1c35eKswfx0NLHwMU6o8p9tNywgf4filnVPP79ZbxWIE2F7Utxen3h1X/g+6w77eBN09F7MN
	FfxGjR7Ps24D4R9iTBjQEjQT/P1PbiLmqXYVo2rF0HrcPlhxJmWZ3JyqTsM6ysPCTu3K0qq29xKGR
	t3IIx8WHR8boy6uL00ReEiMR5KJHLlwts6EO2NCsVptj2R4iG3pTKpGCCIEcn1nOPx/PRTvXMUtqj
	LW2fxHdQ==;
Received: from ip6-localhost ([::1]:58532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lid5C-000pvZ-Vz; Mon, 17 May 2021 13:14:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lid54-000pvP-Uj
 for samba-technical@lists.samba.org; Mon, 17 May 2021 13:14:52 +0000
Received: by mail-ed1-x536.google.com with SMTP id v5so6820071edc.8
 for <samba-technical@lists.samba.org>; Mon, 17 May 2021 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vvtqMDoTKLHBCl0G2xfZrTj+7IgaIPuPS5+ff5c6zLY=;
 b=JHw/J5U8x3poZIE1gAQ2QETGNKasCU3isLw+le/61XMEFP+l/9CDn9jLGk2f67GNcW
 0YZ1W29J1prJQT9Cv8goiOCAOsm9aj+FoinCwGxlfWaDHyUv+bwL9bfEHnru8YTI+7ZE
 83qstSdvGa9LHc/5+/96Th2KUbMT1tpcOLYVvdSaJVJh1lbzl7ZCn965ufpw/bHIiLTx
 5d5hk7DtBBwBGrKOhBEyGM68z7VT0S+41E812DFjkg97Krt3flWIOlF2XBN65woZl7R8
 QGerhWm8ZXIJpYyk3TJQT9TduWMlqx+eRiSvS7n6C/JeQFrPbJwU1B3svjC+H82EMOQB
 kxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vvtqMDoTKLHBCl0G2xfZrTj+7IgaIPuPS5+ff5c6zLY=;
 b=n+m5DzHNsmmqq7H5P1tB3BL6g5IWEf+BBhDOhAXgxmjN55xnOsPUul+yuRHYFi3BFY
 16RY6dhUoZUg6+qrKxYJkLT0mCyyuE7XWL+3KfJ6gfRZDSJs5YVkA6IkSM1UwqiAMQM3
 WfRFu9iUxHnXoORZNg8e3WJ5W3qt8/UuB1EJShoqJCbu/pMRXIupSkP8rYVppbPywhiY
 mrIvVdlMel5uNCChj59si6Zi3AUpOT6fu6xS6D7zX4DWr30jEC9i8dAiaGRXUVWnkrQa
 IzEa+Fd3AkA97pvPHxuUW7L33Ix/RLHnyCzRd/arzbOl1HikdCgCfKrv+LcSUZECAQjp
 cVcg==
X-Gm-Message-State: AOAM532SBYA1wKjsLtdkbxVlVP4YBFBszmb9fXwonHHZuo94scRBflVF
 zyRF8XZkyTZasxpbPMga8qZl524aurgkb8s6RqWLve7MA4o=
X-Google-Smtp-Source: ABdhPJzlL7yOxwp01OOYvEPvbbPcvakaGv9oWHXV/XtMDN43JzPzfeTH+tipbPfjpMHNLqwqM+tleDaBFXaVQsp2jRc=
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr72205332edc.233.1621257286025; 
 Mon, 17 May 2021 06:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <8dbf5fca-0af6-a1de-429d-163952538593@itsd.de>
In-Reply-To: <8dbf5fca-0af6-a1de-429d-163952538593@itsd.de>
Date: Mon, 17 May 2021 09:14:35 -0400
Message-ID: <CAB5c7xpX8xaqWHefqYhyuDGUQH3Fn3yU9t79ZtjP1kam5QGYpg@mail.gmail.com>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: =?UTF-8?Q?Dr=2E_Hansj=C3=B6rg_Maurer?= <hansjoerg.maurer@itsd.de>
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

I think some details from your email may have been removed / missed. Can
you perhaps provide OS, samba version, config details (especially regarding
idmap backends / settings), and relevant log entries if you see any?

Andrew

>
