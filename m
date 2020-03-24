Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A57190A5C
	for <lists+samba-technical@lfdr.de>; Tue, 24 Mar 2020 11:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SWe2EwmOIFy/E/Bg1UxFRoY6VCEg86lQqq1ChuuztoA=; b=AefrsF3VAP153QWePkpDqjyGEe
	HU28LjCV+iUzWtN5M0+14TOAZ8qOmNBoqfmAO45TwD9JoS5sAEgMJxhFMj4Jr1ZkNuKhJJuxL/F8u
	iapn3n4HBpK7gS4bvYIIF4TgelXspXro5tpHyyhrvShqPclUlfw/3pfX/Vq/f5qGo7fskRgRFjjuZ
	oTnItlPVcp4Oj+fq1Q9mQ93jfK3md/xr4DjwdDagraJxJ3cUWL4qSf5v2R1OQ+fKG1a01ti5Fl4ge
	JYuV42r7beRIGLc4vjAaV6ot8/PPl0p08ZN+94qTfFoxxwIrpmnHLe+6N/XCJdgoeRvremZA94oHm
	1xb7MJYg==;
Received: from localhost ([::1]:28098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jGgYj-000XVB-UG; Tue, 24 Mar 2020 10:13:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGgYd-000XV4-UP
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 10:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=SWe2EwmOIFy/E/Bg1UxFRoY6VCEg86lQqq1ChuuztoA=; b=GL7n/Ql2Fkz50x5YOWudQ2zunP
 hBzlkidELhvoS6j3GH/ezYENQR6UjbhS/5Th+/APStqLwH+OP/EjbHQkTeYLewYjdIQZ4NlFCXlUi
 XIUxqzY8vUNkGDUnpsLB25cok14xsTMrMAuoLDx2aGfPoOYLLkFZmnN7dE10cJACo3pe36yKfg4mT
 kFoXWfYZbdZPF1Wtk0M00nUyB0cYh0KojaMnHdPtdPAd/5BbZLE1quSHilCLWROlOyhx/fXvVmlTx
 Z1P+8BrKOCJnXJL7768G+S1OfGGsgHkmlJkkjG6U4Q4z+43+ovFU6K5BBYiglyAlRgRSxto01TIdW
 +W4b2BaqbNJ3Lq4IJXcsbX7J0eja0sbNW9J63shG85FrSetQvtsl6klnWMlTM3S55/En3oOJrnFvc
 V5U6o4kpUC/5+FfPk6E6HdMzfC/t4ODF9ZIxc5aK+jOLy3nDrZfGXFWTJFOJ81wFtUGbV/z1JMscx
 rRnzEyK86eQEWTkBjAYpzwIL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGgYd-0004Uz-3o; Tue, 24 Mar 2020 10:13:15 +0000
Subject: Re: git signoff+ and review+
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2070261.IvKQ8U6GgO@magrathea>
Message-ID: <6b96a954-fb4f-db04-f759-941e7fb62f0d@samba.org>
Date: Tue, 24 Mar 2020 11:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2070261.IvKQ8U6GgO@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 3/24/20 um 11:00 AM schrieb Andreas Schneider via samba-technical:
> I hope they will be useful to others.

thanks Andreas, this is really nice!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

