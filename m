Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432E9D030
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2019 15:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7ze0jl1Mf3/M/vQ6J2EHr4A9PJdBZaMzZH7WTlhGT0I=; b=CXwhKraAhoiCIIl6tiQ6S4Fl+h
	GlDvZMDUyN2Zuj6desNunz+Drkvs9mzKRv0R75L5oVUQC5JvCvFOMt12ZGjPT+iEdiDXDEU7grR4l
	QVMm+h166v1wkbn63v4mWyrX6YuIueUV/J5vPpUZu76snyT6PBc3BzZArKsMO6JsmptBKAceaKHUE
	BhEOmRVckHIt1NWNOohAR3SM1nqJdOawMIGz7k0yLjpAaEX7ftlhHtm+rd2xTedILEGqAjS5IneRR
	beOrPaGTUnDefqR0rgtVdp5GhUVVT8pcNtLU+Um3teti7FJ+LqLQ988VKOk2WodcwJHqnnqEKDxmk
	Hm9LIHiQ==;
Received: from localhost ([::1]:18226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2EoV-008TsA-Fr; Mon, 26 Aug 2019 13:13:39 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:39047) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2EoP-008Ts3-Hx
 for samba-technical@lists.samba.org; Mon, 26 Aug 2019 13:13:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id x4so15019092ljj.6
 for <samba-technical@lists.samba.org>; Mon, 26 Aug 2019 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ILZPnzU6ijsue231JlEw68lqehu7mYO7zFtKia0wTCU=;
 b=cgJb4aNzfrC8zKftBPEYUc39ptQMpN0ZjH3csuDDeIe2/KBQvvaFNYLyGJUmSPT0aK
 ZRHkrJBNrTosGW18Rb/qLVVuzvnn390uTehaiSgis5n81dRUitvGWXwdBli0EHx/zulR
 5Cd/VjyeVfUll4/Y1cPCmqs4hxKf60gk63TZnSuTkukfrY/O+XbeN12bZdxxmHLsKxeT
 /t3IXJFokP4RLFEzwrLoQBGWRwTxWA7XN/1zIf2NQ0WRNXuoMu+335irsARViXEVj5YI
 ihJNI7+UTQgaEzDzckMLRiOkWB3jFWiGvj7e/eWH2Vzg6AWjWd0dVgwvbW4TS/hWo/VT
 McAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ILZPnzU6ijsue231JlEw68lqehu7mYO7zFtKia0wTCU=;
 b=VekUVIKuc2nbCctyGVFMNDI8XlR/S5rwFPPJ3g9pDBNbqmKDABYGl3Wp6eTjGsAHBS
 L6MNzYewc7/4d/IlUzBkg0l2rp0WvqH9lQpZRgBh7Q1oJEGQb3RqiV92DQhXmFhweKj4
 K3JAbh7zPVExIU0mFqGW3/EMbG+bkkJ33ojUWnsydC0wYXgtDaC/Ki/noAKRR2Dm+C4W
 skSNUY4xcF46ArMiZB3mA3M613iKAiYOsSHf5LjD/RFNFzOUJ/XyFPKEoCpNT/Lip3kr
 /IXZP+fpJcblmjpnBnY+So29H1qjQ1ypZ/5/0HtCiwwpGE6QzjXk4DDjh11KnRIGQz5t
 sJYQ==
X-Gm-Message-State: APjAAAVv0VCWw/IwZ9b473DHOnfkIPV0l2d8vBOdUUl1OCaty4GD7zSz
 cI5TmaB9SMWFQhFi9as4pUwPPISR7KGydJFpys7hEOtB
X-Google-Smtp-Source: APXvYqy0txKNBHV96AWSvb35FGJNGL78ZTATUPLt7KLE1Nl6QK8UFtvdricrdfzyyEb16NjODji7uY4xF9uUpH2JoIk=
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr11117043ljj.49.1566825212460; 
 Mon, 26 Aug 2019 06:13:32 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 26 Aug 2019 14:13:21 +0100
Message-ID: <CAELK94cBsS_+AfvaNRCkSdsdjLv5os2D_Wuy5ni41t+jrrYDhA@mail.gmail.com>
Subject: GSOC 2019 - Final report
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, here's the link to my final report

https://rmpr.github.io/gsoc_2019

-- 
https://github.com/RMPR/smbcmp <https://github.com/RMPR>
