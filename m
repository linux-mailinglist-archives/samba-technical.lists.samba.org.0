Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1D6E2AC4
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 21:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7AAiPZXqQd6pFzJ+J86zhEAkqMVDmMNP+uRmdENCCB4=; b=lR9pFCIiKhQn8qirs+Q3eVk18L
	Xp5fInFCt+DcNBMOw6emTSXiYMBxR9v7eeJisaVUq39t0SHnmMs7rkZffWuyTUhM33x1Nk1vTOW+g
	YMXEjjRMyyKlHc8OOobPHXoTV35dGBtHCBjJ3blyByagh/CTyHEn4WwfC2HjhmcSdeR7wcTR3Ey5q
	gjMy4aALMhYzC+3RP1LscbRjtSRiBfJ+FMFeZ+1s7643DJqQOi/5D0OXb1h0i0vx91puCdDbbHfUU
	vmGQhHGqq/sJE2U66RsDffOHeufEQZxb4gDXdjiuF1m41DtkTAzQ33jkcnsKQNiUNMWXpeduZtmyx
	lMhwnwIg==;
Received: from ip6-localhost ([::1]:27540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnPQV-001tbp-HA; Fri, 14 Apr 2023 19:49:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46595) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnPQQ-001tbg-8Z
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 19:49:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id w11so19376407plp.13
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 12:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1681501776; x=1684093776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7AAiPZXqQd6pFzJ+J86zhEAkqMVDmMNP+uRmdENCCB4=;
 b=bGKzpodRtKLc3sLQMdgdLCLe1XLY2vprEQ0LxIH+JhspzHTkD5o07DZmJzDmyzL1yK
 5+KpvXK6y8yxoyUHUtSdJTtLwFH77lwbBN6uUv/W3duDqmdQaH15dF+NljyIpt+AYlP0
 ArazBn7wDTwOnhmCzNg7NHA9tcHEL+V4JVEntYxHmk6Wnsp0ZhQDa16b0FpqXVmdCCEK
 tvWdWLxNaDGeAv4hAyr22Uo7o0r1nSzZ5YxWpWMsgr7DUI3ET7rXEgtejonAdRno3hEY
 cP/J9fXFX7xWpfmuPslna2JYiXJKI0alpQnERVJWECxPmzRlsPwpc+jT9dEP9jgSN90H
 EMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681501776; x=1684093776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7AAiPZXqQd6pFzJ+J86zhEAkqMVDmMNP+uRmdENCCB4=;
 b=LZcYC/84njOoiCGmdLttiuMAID2XEZ+rS6oz8+Z43WZ496Bxxnj092D+B/u54/cKkf
 cjGkuJ6kJUlRCB2jGVhCYpV2syNlZb9Tehzde2ebjfRGM1sWDPNbY3rqva3qQ5k6sXfy
 /EhD1FILBUnU+yZub0Zd7xWKGg6RKyYnm9GML76csp+vsGdpcdLi1QFAU08a6huar9aj
 ApxqmVR1Xlt34imx3mJHyww2AScOl4B0dR2vfLLwKesSsXkONR5lzqApTBWHgzf6iSM6
 NKt0HSD9r2as95HiHGJjdQGLSBC2tQlexx444PCwAbRaVIFfzB0J5drOjQlakf9bJ/RV
 TiXQ==
X-Gm-Message-State: AAQBX9d1vaCZ93YW/pO98N3NkdmQWZoe1vqLRdjFdxVotqdSRMzyGaXQ
 MLSwlfu1I039B3FuQuCumgiNN0+1pc7vBqDLdgN21g==
X-Google-Smtp-Source: AKy350bl7sZhoCA2TKTNuaVeGJMOSnfcaglCaAM5oR+CiEtg7CipxMJCk5f2gYkqX76wvCpHf7Xk53BPUzZj4lEBYlk=
X-Received: by 2002:a17:90b:4f42:b0:247:279b:f869 with SMTP id
 pj2-20020a17090b4f4200b00247279bf869mr5675055pjb.21.1681501775775; Fri, 14
 Apr 2023 12:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <3161922.5fSG56mABF@magrathea>
 <CAB5c7xqj=X77E6roZhfnaRewLtfdzwPx2SE4rodRFvKB75MfBg@mail.gmail.com>
In-Reply-To: <CAB5c7xqj=X77E6roZhfnaRewLtfdzwPx2SE4rodRFvKB75MfBg@mail.gmail.com>
Date: Fri, 14 Apr 2023 14:49:24 -0500
Message-ID: <CAB5c7xpXCAwtms3-AgVMH+peEd2GxMRoZjfv15Hapnpj5odWJg@mail.gmail.com>
Subject: Re: talloc vs malloc speed
To: Andreas Schneider <asn@samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: fweimer@redhat.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Oh forgot to mention: I don't recommend brute-forcing jemalloc like
that. It will potentially break applications using python modules that
use talloc. Threw it here for reference for some of the minor changes
I made (using calloc, some branch reduction, and removing memlimit
API). Can't recall off the top of my head what % benefit it was to
make those changes. malloc -> calloc benefit was primarily in cases
where I was artificially calling talloc_zero() with something rather
large (which is probably pretty obviously the case where it would
win). I poked around on it on a sick day IIRC and haven't been sick
since, hence no progress recently and a fuzzy memory of results. :)

