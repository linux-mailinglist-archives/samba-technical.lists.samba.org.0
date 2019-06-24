Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E3D50390
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 09:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=1j1dRkIGlB70zYqwOGQo3WG3mt
	LBSt1Y1dhESNKMS/cnPrvKE5E7lchmTxie0gJuYHBIDo/Anxe6I/jap8sCrTso/JPqbSzXjv2sIAL
	XZwy+JTAZPYp/DHeuoDOr526CbQDFXVHEsXGwr0fQYIx9C1dikSG1KNWeXXsxc5FQ2cYnKoh+andC
	joCQkbOGDtkzdy+CeSNn5HQMLakcgi4Oq9MyiHF6qoZva8Sx5ofihzDhGRv0zGSr1ksEerCzSCEVA
	x8NDk1x+nmEe8sQAnkGotcv1WSvEJ3T3oH1YKo0yLxsAmqhfhxWPPFkfeZgwJG5D+T3QxioiQqO8J
	9K+E6XMw==;
Received: from localhost ([::1]:28708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfJU3-001O5l-1E; Mon, 24 Jun 2019 07:33:47 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176]:40347) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfJTx-001O5d-HW
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 07:33:43 +0000
Received: by mail-pl1-f176.google.com with SMTP id a93so6399497pla.7
 for <samba-technical@lists.samba.org>; Mon, 24 Jun 2019 00:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=osiifOFBJUnTw1+Hrv4PdBDNLo+jRJgrPNMHy7nZswUQiMH9Me04Jyq+JL6vjDFnpV
 vpgoJgUnvtHk+k4d28cQv9WxdwUbeV6qBJqMnKfXX2NUXMNQZtUBetTtnQtvtyPhABOp
 M0odU9SCaz1VJeURZov9X2a+zAwSJiME3RE3BMUptmG1dEK1H2t91+xo2Cx1Up1j67sF
 VwaaNNl5uJXEKVUw+BvKRB4ylUbT1wTW/X9okQvBs0E03PCB2pKCx6wxlhkV1osmkiit
 R70iHXz5MzujOAJgFMMRIZ69g2B3jJctErq1ORnFnFOT4A2BBCk2RaeHzyZLaJvaVslC
 ZW5Q==
X-Gm-Message-State: APjAAAVMfWYAgMmaWHCfSpx/2EzJHV/55YluBN1o8BGkeDwB5L8937NF
 SfPL414rlrBUiGnvOlB2hYFkxGfGssI=
X-Google-Smtp-Source: APXvYqwFu28StX7SO0nnyxLZKGU4OTE8BgDyoBnB0gxl4VRZH1anv5Ui7cHlsvevi8Jdz/d5nzowRw==
X-Received: by 2002:a17:902:165:: with SMTP id
 92mr120608413plb.197.1561361619148; 
 Mon, 24 Jun 2019 00:33:39 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id s15sm13363987pfd.183.2019.06.24.00.33.37
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 00:33:38 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Can we RESOLVED/FIXED
 https://bugzilla.samba.org/show_bug.cgi?id=13142 <EOM>
Message-ID: <7b698bfa-3f52-14b9-32ee-f914f49fbf5e@redhat.com>
Date: Mon, 24 Jun 2019 13:03:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



