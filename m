Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E657D77
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 09:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=39ZtoUBTpLXoz78uhJvatPYEKeJBQq9rSkgwJ5wqnAg=; b=nz/tC7ThF5WJNsCOh+GGMvOA5U
	VaEGJgTzwpRyw+F3JvboH/Id7iWsElR8pmKiYLnVVLPdwiv8bDwxiuvUtQ48uqJrDI1AYrm4WsBuC
	furBCP0gRBCU/FGttHIB3vSa53D9pHIRqNAySIsknKQ7kvOlSBZ7ZQ+P2Y0BKs+v+3GkV6Pe/v1ew
	Uca2LUSzJMSB1HvihnhzcP/WL7QzgH4nqIp4lAwvC+3mT8ZyF6/cltEfnTYLwoJLkY/yI/5gLeKqK
	bHFnnzUIvp4r336uHH1Z977oF4CDhYtLyZikgX2LiYIqSI72GjnhCrwrCyqGceOcVkBYMRMXq/1ey
	H9HoCv3w==;
Received: from localhost ([::1]:42202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgP8I-0024vJ-6q; Thu, 27 Jun 2019 07:47:50 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178]:36501) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgP8B-0024vC-2G
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 07:47:47 +0000
Received: by mail-pf1-f178.google.com with SMTP id r7so802091pfl.3
 for <samba-technical@lists.samba.org>; Thu, 27 Jun 2019 00:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=39ZtoUBTpLXoz78uhJvatPYEKeJBQq9rSkgwJ5wqnAg=;
 b=bt4Tq1UieOg/uNymckXElxkmvIlDa1Ce9KoAxJx38lsh4NMtKzWcYvxUfCdjwbD5cy
 t0J86Du9psSdn1A332aFmj8Y2l1lv0I+Nw2JO1bVIyTtYal7NsHkPcTbeO3nHIXHt6h2
 5X7k/VAqx/8d4XZkoZDwqNp9vE0h9Pjm4OTzSlZNhKLemltPOL6W0fsjopqVP+yHkbPk
 V9iI4DuBfkuJrqreQKB/QwebTLIuwz/DoIYnmkXE0Epyn3Ak3OVrmyjaILlJc8cdRFLy
 dv12Cy7rNHT+wzjfxq9vGva5IgGTVAveryXT97iM3jhd5j3gdLa/ncRhIkE0EcDHV7XI
 v6Lg==
X-Gm-Message-State: APjAAAUBemvyUgHv3+xJysuBNepNHN2g+a65NB+bLXQE29mSGF3YluMF
 fk9NyrP9w6bbYKnRva++Tc4EEyGP4ws=
X-Google-Smtp-Source: APXvYqx+1SH6auTrBa6b1IkbWwB/81yg4QxoMKTjs740Ud1+6WzoKwdT1aCAsFnQpKprXH093DpQfA==
X-Received: by 2002:a17:90a:2244:: with SMTP id
 c62mr4451967pje.29.1561621660304; 
 Thu, 27 Jun 2019 00:47:40 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id a3sm2210290pfi.63.2019.06.27.00.47.22
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 00:47:39 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Can we RESOLVED/FIXED https://bugzilla.samba.org/show_bug.cgi?id=13564
Message-ID: <e002d5f9-0911-3825-1859-07ffc598050f@redhat.com>
Date: Thu, 27 Jun 2019 13:17:19 +0530
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

Hello,

Fix is already present in samba-4.11.0

Thanks


