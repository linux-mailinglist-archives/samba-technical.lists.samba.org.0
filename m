Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F027441C
	for <lists+samba-technical@lfdr.de>; Tue, 22 Sep 2020 16:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EjfNjrMnTgY2Kk4J04w3ahdv6OEDG7QKiLsUfSzlJjA=; b=J9K3J0TYMuTo9qf52rjOHuOn/x
	ZBZbYltG25uQmwy2rQUNOF+seM3FAtzZcbWrgpvoVrXHjKBEIoTeJ5jsWiC316/fgD2ukYcaqvQkX
	3giw5N9QdKxkjEgbZmabBEsrC27uPBmyh/SrbCEmrtqbDy+OBVt6r3mZp5bYsweIRgUkb0XhZIjUZ
	JILOdE5RGvV+Ju+/3gx78Eor4Jxbad+urjsxM6xQ10rluvGNtrjFjMWZQ/1L+0vRP+gc3ckTJNCmo
	5f4ApsJ/Yb3WAgmV6cNI/6RRR9mo3TlF+GnQo6Jj6q8nZGoHA+i93arA+qSSad+7dwA1yUCrfJCHG
	OTjzaRZA==;
Received: from localhost ([::1]:46878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKjBz-006hC4-FU; Tue, 22 Sep 2020 14:22:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKjBu-006hBx-0g
 for samba-technical@lists.samba.org; Tue, 22 Sep 2020 14:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=EjfNjrMnTgY2Kk4J04w3ahdv6OEDG7QKiLsUfSzlJjA=; b=bWzFvMIwP6V7gFDSHO1paJDxq2
 VPL29L/v4kt6a+95vlw8/iNrCq0eesy/yRYcGfd8uxo34WPCBky1caXV3o9rrSh/p84Q0/T00vR0L
 PgsHMDo9JJcbZ5vB0LLEzpYaFYHr8aYZP94e05KG5idgVI0rjzzUpX78E7uL970zvNhHsSEr3A5RZ
 tylqMCzH1Cv5uNRlSmcgLfmW34U3yO1TELQVFiqdRknxeLjcB8kmc9ZxizE8zvkLwFTqYsSR8qN8d
 JhEfYXNkI2q8IDQJ67nu6Nl6dmqGEzV6nujeHfNnwovJEV53ufZX3ZBFsa7GHIA6EuTkHIjdf/CpK
 bCbP7XPjgqa0V1KXTAmrNy61/xInTz6SJHVF6DwH4ZjG+ajg6FMXpRVTCqYGZveIftRHJuHtnhtqe
 l+b2pIAIc6m4omlnN6hBvbL2kN0uvofdruKq+KVi0u/mw8TrxcS/bYFvsBFW9qQmKM5ANQBszWQ+o
 D2NTEb3k4om0nqD+bKjwYY2L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKjBt-00006H-FQ
 for samba-technical@lists.samba.org; Tue, 22 Sep 2020 14:22:45 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.1, Samba 4.10 end of life
Organization: Samba Team
Message-ID: <dd87ca63-dd48-4206-dd7f-5c023dc3be43@samba.org>
Date: Tue, 22 Sep 2020 16:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.13.1 is scheduled for Tuesday, November 3rd, 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Please note that with the release of Samba 4.13.0, the Samba 4.10
release series has been marked end of life.

For details on the supported release series, please see
https://wiki.samba.org/index.php/Samba_Release_Planning.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

