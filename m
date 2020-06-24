Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F9207172
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jun 2020 12:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4tysaOlUT+bDkNRlyARtB1fsEBP6/MejpP3ela/s+hY=; b=n1tYXSCnLml9IRDwYcfyAqAHy6
	ZzFsT/q5KrUCqUl1J1Y+Gs25mLmXWtE6K4CLQU/wkbnsXO7mKj5tNfkqn20KzlL0DJs3hOcvbgDOi
	hRhCWfe8Gtr2MKdUd7s65qms/RKoqjBVOh2G8+luKvQ79gGCfJRfQulIUHLkVz7fwpxK8hfnSmvUp
	E7rqoaK8oMBbeG8qrIPk3/X4taazRULRw9Rb8+HSoGY5LOtDfyjGTw3QrPqfZF+1lP1RHR/uWnk7R
	5KHtgtQ1Y/TR7FnDxta+y8BFLfhTnx6Nv4NhUEs4F3gwILShTLTpz1RkqFV8yDUkdlEx7tCY2paxd
	3oP8DSQg==;
Received: from localhost ([::1]:35378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jo2vT-0028PK-By; Wed, 24 Jun 2020 10:46:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jo2vM-0028PD-Td
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 10:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=4tysaOlUT+bDkNRlyARtB1fsEBP6/MejpP3ela/s+hY=; b=P5wF7T+N+Rx5n9r27yPw/3dkZo
 ggXD4xDUgOCWTbIwngCVkn7hdeSSPRSfLYUjx0FLfHM9NGky7ITwN61VD6nPEDtGp/fpS7EzueIwe
 IIbNUP0M8UostnP09juP2I043oXkW88TiQcDes2AcAdfXqrg/i1SFIGK4YZJ9BGkswiP951vJFJLK
 Ie2SiLtWsZWL90fn04LjOFI0K2RBoEwwdDhEyHubKN5JnEh/AStPph3gSU9q5XXzRvv2u3CVfKM1a
 QPjrJ3bjuJjXrScqxMY0W8omIkeLE+mN19vgqsKTofe6mxMmQAQWhXmgX5YFCf3HEzQ+ey2piaenj
 tOGzjXSXZmokY/z9JsnYI8cvRhS0rR+EEOiYfB5YlRrYS3xes5tvUvnMiJOOxfrgvQPhzJVUGcqqj
 KkR8ACbYzq6TP4pJfcMayAsM1v4YiLyWR3VL+V4E/iJFGbvy0wznJLgWoldwS1tG5j6oITDdZ3qt9
 R8LwGjTbd9Viay3KNcdJweAS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jo2vM-0006QV-Jp
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 10:46:36 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.0rc1
Organization: Samba Team
Message-ID: <2f3c18c1-84bf-9705-cd8a-08b3d4d2f8a8@samba.org>
Date: Wed, 24 Jun 2020 12:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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

Samba 4.13.0rc1 is scheduled for Thursday, July 9 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

@developers: Please start to fill in your pretty cool new features and
changes to the WHATSNEW.txt file. Thanks! :-)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

