Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3613250C
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jan 2020 12:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=P/5SaSWQKiSQAmPDu8ZEWbRwsjSJDKI09W/BEuw0LV0=; b=Q/aDQqK9UqKsh3og240khN1UW0
	FmDnUmckQO0UgIHqvFHra6xApqDzEmCyM6aKPvDyCA97YeEUi7BQ3FQldx6oRGIJ/a8xl/YBfAP5P
	6LZkwectkNDaGv09Wy0ZM1Vcyjx07l/DauKMnNP+q/EWQZnPaJ/j3ZEv2vN4/HPv3WaCahMm+BrbO
	HDF4FdqUluhM8Y8ubPxmDTZkXy65jTmBkXcq9Nugj7vSV09a3XIK3FnXzWBQfAna57wlANB367mpY
	nEVm26CTqwE+Nb+Q9ivnI0NqR1pUm3bJBB5zPaLWA5TRaJ9JcsLv7e7PO+Bx6JpOsnAsbN8Dr2k5d
	w4+Llz1Q==;
Received: from localhost ([::1]:21390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ionDs-002djH-52; Tue, 07 Jan 2020 11:40:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ionDk-002diq-Nm; Tue, 07 Jan 2020 11:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=P/5SaSWQKiSQAmPDu8ZEWbRwsjSJDKI09W/BEuw0LV0=; b=R747YYCyihKaYq30YmT0A0OVqt
 /YfafBHA0OlTH95TF89CWBGiiPAbr0oS7BzL0sN3KSCDhZHf8nfEyz1jqG4vlEyMME24DjXkiEZWK
 0dXJqpsYhFkiNCZQwY8hScBIjk/iOWqlJQs8rnLYOTJmN+qxRlzuHH3hR6StdL5o95/gCI4aFJcCb
 MW5/2RSwtmBJiPKwsFfMj/dp/mRC4fq5qOU13AoVXfTV5cXpNi/tjP4EfIwhwerRLbwQhW1WSxGIl
 TGk9X+W+nT6xBbzgjOmExNFCHycP1FajKZ1zA0hkEJUrmU2X38EKF4my2KqTKUfzLzR6JO2dL2fxS
 wAhOrh8QNRMncEjSDDmecDGjk7jTUUJLPZYJSZ1oM2E06lGMNd9lVwgH1GGd5D1tQcNgZOK9U5AMm
 cC4ww1BJ/dhB0GumcxwbyyRhJXbyrtBaKKA/Nc2EpQ7uBI8JQ7kBs5vG07TxTdTgrGBvt5cIU7eGo
 eTX0GLx/+cEXUA9zAeWaHsGP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ionDk-0004Gw-4N; Tue, 07 Jan 2020 11:40:24 +0000
To: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>, 
 samba-announce@lists.samba.org
Subject: Heads-up: Security Releases ahead (January 14th)!
Organization: Samba Team
Message-ID: <bea68fc1-5478-2c3f-f4eb-58b42fa87015@samba.org>
Date: Tue, 7 Jan 2020 12:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
Tuesday, January 14th 2020. Please make sure that your Samba
servers will be updated soon after the release!

Impacted components:

o AD DC (CVSS 6.5, medium)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

