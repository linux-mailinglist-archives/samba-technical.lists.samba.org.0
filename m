Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F51AF267
	for <lists+samba-technical@lfdr.de>; Sat, 18 Apr 2020 18:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=eHKhXCiY4f/Kv1PZste2NPbdW+Izw05lpYsmRWKFeCs=; b=HM35NRQ99CPw+iGRCEqcZ7PVtP
	kcGFvWbJJJibz8YWziAPfypKhhEW1oDyYjZIehdZL/QN/s/NSdOkJxaOXO7JMEYcsBUMZceScLBrh
	tv4SEfDWCazOPLJgX5QiTwrHrBSFRKkNSsM0HdYB0ycfeCxLE9Mjjpi0Z96RTr6DdOfbtw/QtTDzu
	iMPoQNJluUFuRsXBK6a9K6qn9YRZcoxslSqxGXPkKR+bDvo12M7GUNJbb4BLCkmuUk5ptil4bAVzr
	ieUd1eRxxXh6bW78EPyGOg9D4PSds3iafuVHgE4284CZOCNEsPeg2lMgbQx7mKocIa91bFiWhhZXR
	J/NqZCFg==;
Received: from localhost ([::1]:57366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jPqXH-0019hz-Oo; Sat, 18 Apr 2020 16:41:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jPqX7-0019hY-9r; Sat, 18 Apr 2020 16:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=eHKhXCiY4f/Kv1PZste2NPbdW+Izw05lpYsmRWKFeCs=; b=uW8lcbeTr0S62LkIQTsumpbOtF
 y2beYepbKSmgP9d7RlLvlY87UyLgJkIVKIbp1uIHh10Isx55bqW1m8IjTXicfo5CYpEe7zq27wg64
 PjO9luhiPFeMawH85skuk94w+EvHTK5zwuiEfX+98+I2T8JLBnZ/GM1NHzNlGFA+RJEGw2qgxIge8
 zffCByBTDp5dlQNjLoGMVAjZiZO936uCD/7e8ue/s1gDxn4p6PKTxoa470RqCRE9MujqCnypD3jZ4
 haKUtjYu+PDDuRyzk0ItGs5ftoaxbNCL/HYXpCtm+UJbyGkY/pM8LM4whXAcCm+xN8Mvwb8fEYWsE
 58iiTCdU7yDQa6xzvllTmXfsybQJwjStm6AjyaebZWGbYOK9Tk4L1amzkzbXrPgWNsCVXmt5qHojp
 zejNC8GX0EUlaRccitgkU3ijLobjSVbhiSgc8wFTIfVFrJSXUU60neM4qZa9yY60MhES5dlFRr2+J
 W9lH11iSsRXNyfnPqjOvgTVb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jPqX6-0006kD-VZ; Sat, 18 Apr 2020 16:41:33 +0000
To: samba@lists.samba.org, samba-technical@lists.samba.org,
 samba-announce@lists.samba.org
Subject: Heads-up: Security Releases ahead (April 28th)!
Organization: Samba Team
Message-ID: <36b9fd9b-c320-a0aa-091e-0d9c5e18ff11@samba.org>
Date: Sat, 18 Apr 2020 18:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates on
Tuesday, April 28th 2020. Please make sure that your Samba AD DCs
will be updated soon after the release!

Impacted components:

o AD DC (CVSS 7.5, high)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

