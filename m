Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3867FE05
	for <lists+samba-technical@lfdr.de>; Fri,  2 Aug 2019 18:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=rjn0HnMnJDJplVULqwHC66VM/YYGLuPAzezbjeh+XbY=; b=qyz4ATcQWTtq7G2hRN9cft9yDa
	Pp3bccQdE61NTu2q+TQN13mOF9DnIFRiBl8LGMqR2O1k4p+rnWIJJuipDGx+QiiySYKLfQQnT5kq3
	rz1R6No+nB43VuyLsPE1d0iYV2zIi2pPXLCJToex/xt+M3CL9XqitKpl3ybtnJiFUOBTuGffzIaWq
	rQJcRYuRj3n0zpTGr8L4JSQgeJ0grzElAj2bQbwr6MHw8AEaI2y5kWV8ziE+IrgzLvqVjXtdzPKii
	KzeprVsbxmP9jns2acrAvaGzOO+T2w3nSQtlUL+CNqgKvb9iWpaQ58IEdV6DYSr+Teo7TYnvlnkuT
	arV7Bduw==;
Received: from localhost ([::1]:37472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htZzx-003ZTD-O4; Fri, 02 Aug 2019 16:01:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htZzu-003ZT6-9F
 for samba-technical@lists.samba.org; Fri, 02 Aug 2019 16:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=rjn0HnMnJDJplVULqwHC66VM/YYGLuPAzezbjeh+XbY=; b=WY6twaYp1efQyV1SkDIgKBwZ46
 IwA0DzbbhbQMqHCotL5m9yYAy3CKaKQ9TKNftQdPEkDEQGe+0jgq7rfYXTTZTIaU+Bhf0pLeH4JYZ
 qnQAIP610eg+GTqY5l26BveCYSkzrE6eBlI88KRmAuDDzLxltLgEG1v2y8eRvplJfQ0s=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1htZzt-0001hz-Mq
 for samba-technical@lists.samba.org; Fri, 02 Aug 2019 16:01:37 +0000
To: samba-technical@lists.samba.org
Subject: LDAPCon 2019
Message-ID: <d38f6779-5f20-0ca7-b03c-d63ea5d97bfe@samba.org>
Date: Fri, 2 Aug 2019 19:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Nadezhda Ivanova via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nadezhda Ivanova <nivanova@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Since Samba is, among other great things, an LDAP server, I thought you 
might be interested that the 7th Conference on LDAP, Directory Services 
and Identity Management (LDAPCon) will take place in Sofia, Bulgaria, 
Nov 4h to 6th 2019, and the Call for Participation is open until August 
18th. If you are interested, you can submit a talk proposal at 
cfp.ldapcon.org.

Best Regards,

Nadya


