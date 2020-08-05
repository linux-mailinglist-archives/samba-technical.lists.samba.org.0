Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CA23C7E9
	for <lists+samba-technical@lfdr.de>; Wed,  5 Aug 2020 10:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=QkG1j8vWAW8YyAC+dLThOuch+ImkntHxAAlW+onoO1k=; b=vIr67h5kUGApRY9l80v20JwSJI
	Hiwegl2BN6wpsq91f4uAt8nPS0cBHxrbgjJDq/cfqIvzNxSbg1jqyk2At1Sn7jdGHqSOhIai2hg3t
	U9JVJJ42j1hkfuPKaHnyZDms3tZSJ8gkNTfZNohQnHOTVQ9wmQwNG3baUCUaz6dth3/7AG74BHfBU
	fW8NdmELHVCA3VAx0AOMZVK28gOPWYiAdCikMXIRYCwC68J1NLq42klHcGc0thVR9FaNQXm+pw6ko
	GWiVpbGkvFTZSBOYvctowrd5Yb21taMM2M0YIfdQZgCBUZXmet/1j3Ki74DC6sJlHvGVWBapoJSBG
	LERqUS5w==;
Received: from localhost ([::1]:18400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k3Ev0-00CWBr-GC; Wed, 05 Aug 2020 08:37:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3Eus-00CWBk-OC
 for samba-technical@lists.samba.org; Wed, 05 Aug 2020 08:36:58 +0000
Received: by mail-ed1-x529.google.com with SMTP id df16so15550479edb.9
 for <samba-technical@lists.samba.org>; Wed, 05 Aug 2020 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VrulkVa2YDjl7k0cnf6b03sHLj4glVsGVgm6xLvFT24=;
 b=kRuxSSIWaZ0UZsnK8ty2yX49C7O+lbnLAhLS9Xm+K6XsalkBlYsQxMfquZRZYs86Jb
 GC5PZCj2kg14lEPnCWHXm53naJyEqMRT4BEt5Udom1Cm7cEZHaY8ZOFihO4SmVGskxSB
 kGyzpg1Q5AaZKATOOqka+YjPQuHwodkG72kHpttffeo3n1OqzwbrSUe/F6keVpZ1/ncW
 kowoTxXRPo7ClSDJduxQMYBf0gMvIeZQKGee5XV9nOgdb9CrCWEIIfMzl2y1VsJbKLL2
 goyrdB6PhuzKlhpIIfPkBSelFVA+Cwf46Y+Womq1CaYeZ4vAPEoHTup/R3l9IQq3lIBN
 Jdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VrulkVa2YDjl7k0cnf6b03sHLj4glVsGVgm6xLvFT24=;
 b=NIY/d2nmTqlQYjzvoBhApmKrz2i0Df1UionjHUSnkWRFyQNHWIPvpG0WYvzSa/BUji
 z2Iaps0lLlw3UH3s9hhKzQiEFJQ0cT5MkxzwofPrkHoW+rZm4dvb6TwSi3XbDDihcgHE
 Vcr1u4hEGOLN21G0OHxfmJ6pUIuF11PsyiFYOw78R/jfJRIjMYFrVtaBO2O0WRlajOq9
 PT2/NW6CFFNOo6Sb1AtMoTsofc7zcAoUErKl/fRP0WsKVHUOQfGqZA90qqswq3Az9lne
 OOVYu1IkVbfRRhplj19f+trCk1SbMPLcHThUKECJ9VWpnvuTPhp4r68jUmsJMdOdYe0l
 TVXQ==
X-Gm-Message-State: AOAM531W/UIqvUzzGg7u82AzDGiJZjemA/XepUxpWKb+d5r+X27FTrqY
 6N7QNzVW4Wf/jHvSK8SkVMuEVYbYn5lzmqD3dIqkLA==
X-Google-Smtp-Source: ABdhPJw4LZZNQdxhC1FrpwES8JEYrvYHY3py2O/QVI3PepD+epencOiPbHa87bjlY8dPy/Hxgjx8MOG2sX1a23U3OF0=
X-Received: by 2002:a50:ec90:: with SMTP id e16mr1826004edr.234.1596616613312; 
 Wed, 05 Aug 2020 01:36:53 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 5 Aug 2020 11:36:42 +0300
Message-ID: <CAH72RCW7gZ9sntyTzp9AHSbZG8xzLPHL5R3m7Nk7eUrUk+-QCg@mail.gmail.com>
Subject: GSoC Progress update
To: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
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

Over the past two weeks I have been working on the following:
Packing for various based distributions.
I have started by first targeting Fedora 32 with more to come later.
Group Policy Object (GPO) management. Some of the features includes
creating a GPO, deleting a GPO, listing GPOs, listing containers, deleting
links to containers, downloading a GPO, backing up a GPO, Setting a GPO
link, restoring a GPO, Setting inheritance, getting the inheritance and
showing information for a GPO.
Flexible Single Master Operations (FSMO) roles Management. Features
includes seizing roles, transferring roles and listing the roles.

The link to the repo:
https://gitlab.com/HezekiahM/samba-ad-dc

The link to the Open Build Service:
https://build.opensuse.org/package/show/home:Hezekiah/samba-ad-dc
