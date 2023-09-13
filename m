Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BA279F498
	for <lists+samba-technical@lfdr.de>; Thu, 14 Sep 2023 00:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=umY5bG0W52sEuGJQBIbLpB/qru3Epl0eHETpQUxqPHU=; b=rkqAbl50Ql8n3P9WcbV4KkRjpW
	6qhqfQz2jFTI3qBEapvNiw/1Ur1gDEwXfZXm03FWRqZbGAqrLUY851SmItPn/HzSlbtEQnqsUbyZh
	9pIEZ2kzyt2GIWjCEZjyD0Gu1bFA9/ZYD7e0sXn+6YyTNnYr7mxRnbp4oIKQFWxIvbaBZ5yJ0rwXq
	C1/ZQ65jD6yBl6l66PJzU0dxOcqeXJLYC+X31SfTTJBzEiSJB57our7xvlJIR13Gs8wZ55FVIIskH
	l80JGykvEHpIT4JnR3Qnip6/axJa+/DwjNFUAfvB41+fU0jvvlSFpGfk0ByAyJmIZTi0nQyFRbYyQ
	dGWpiUTw==;
Received: from ip6-localhost ([::1]:51282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qgXwn-0048Zl-T0; Wed, 13 Sep 2023 22:02:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qgXwd-0048YQ-Ie; Wed, 13 Sep 2023 22:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=umY5bG0W52sEuGJQBIbLpB/qru3Epl0eHETpQUxqPHU=; b=AhqJFaynnbrZzJuMljZlqu/UVO
 fHbvMttbQDaR8fFloxoAQ6m4cJZtrTPj3oO6LHJb9f5hswf5eGqLtB9VeSucSH3TMQ5jQlJGGv4iG
 KNMaDuWjRScR2HV5fsmWihz3y0P3H9ft1Ff8T1bouEN3+ySuhaOyh+vokxXutfzNntCmOuEBRISY9
 OREh0F11XmzXr5zctRv87tBqLuxlFareUGI1ImV0C+NO61CxJTBcWb9ziKFKL13ScLCe8DtetvjHx
 jLjTk7/UQ2zjD6Z+TAbDXaJeRzhnqmYOxT11WTAoG1eP09oSfIY2UyY0RHbObe8B+Rx5E+61fZo1D
 R3UV5RKbYtbQbODSpPCYMKF4KMPnMZX5O+HPAmfE11VsbwFnKiHVbrLAuPOnR0qID/DCr5OVzX1mS
 9cr4pn6ViVjLlhJFA5tIH5612hRYV4Vxj0eSjDZv+TMjbdt+Axh8qL3NDP07TVi3w66w+NoFiYmom
 /MyQzqC+4RRZto4YenJ/u7y4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qgXwU-00DNVU-0A; Wed, 13 Sep 2023 22:02:47 +0000
Date: Wed, 13 Sep 2023 15:02:22 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Samba Team member talks at SNIA SDC in Freemont, California, USA
 next week.
Message-ID: <ZQIxblLD35+k57+C@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There's a strong Samba Team presence at this year's Storage Network Industry
Association - Storage Developers Conference (SNIA-SDC) this year in
Freemont, CA. Sept. 18th - 21st.

Looking forward to seeing everyone there !

https://storagedeveloper.org/

Wed 20th we have:

Reparse Points Current Status
Volker Lendecke Developer SerNet GmbH

Samba io_uring Status Update
Stefan Metzmacher Developer SerNet/Samba-Team

net use //samba/cloud: Scaling Samba
Ralph Böhme Samba Team Lead Samba Team / SerNet

Advancing Access to Remote Files: Exploring Recent Enhancements to the Linux SMB3.1.1 Client
Steven French Principal Software Engineer - Azure Storage Microsoft

Build FIPS into Your Storage Products
Jeremy Allison Engineer - CIQ / Samba Team.

