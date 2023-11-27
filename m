Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A57F9C77
	for <lists+samba-technical@lfdr.de>; Mon, 27 Nov 2023 10:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Lpn9dz8zjRms7Y38ONVIw8KJ2FtakkLsoN+0BY4aUhI=; b=QMHHCPJYECCjZh5VSCaUglKTx4
	4r3DZT/XJuQ+m/9BMEeNHiAmLJuqiIeAgXRCn3Z8EZ3LunWFxGmg+QOnN+D/7Nc1CgJ0HCCW+cZlp
	ASBZNNxroww292gXGBq1Dv93+ihteaM4PjIM4Mz5M7MZx2tLkeaoefpxIkPTTFLanOqdgMvYnexcQ
	TJ+Dekp4pI9LLhDbiaoKHLQ4voE5kd7A12TewiASxpRiRsyL4iXx6rJ8A6e2pc6jSu/i2FqawRPoB
	CtIotziygv9RgSjmKndJDwwZwQhWXkgfiwNeR9mcvTynkHXt+n0+pKWVhIIP/p1flVYnqVNyDc8UI
	/Lt8hf0w==;
Received: from ip6-localhost ([::1]:64252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r7XjJ-000loH-CI; Mon, 27 Nov 2023 09:16:37 +0000
Received: from mx01.mos.ru ([94.79.51.64]:47704) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1r7XjE-000lo8-7k
 for samba-technical@lists.samba.org; Mon, 27 Nov 2023 09:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=mail; d=it.mos.ru;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type
 :mime-version; bh=P2iV6QBY+1ecypA0l3AsLGjgvZ4=;
 b=VgT177i3bizFRbwOxewFAGBSyL3FdUsVMPjkdQogTTm9pP+y+cnb19Ap/FYvYt1K8A/gF0HN
 spJb39XeSt2iqp/SWCNMvV57zgQ+8oK+VUcRfh5icvu6R8bsZkndWJfP6nlzl8phXenFICRJ
 i8rwyD0En8H54+Q9/2pkOpIiObXamir8VMV7t+ownBMwzHFiGrqodAWHGFLrRWksH7n7MqPt
 FrqlZqlr37ZaAAzC96eaUBQ9ZoOEFVxkkrgBiaDb065PiBLkczf1zQ23p1+LkM42u7aXQzjF
 CMC8xjYw/2EAjgPLTFB3gAWQLEbkqRAg44fS5tljGBfbxPeelso80w==
Received: from eps-mbx21p.hq.corp.mos.ru (10.206.152.120) by mx01.mos.ru
 (10.206.164.129) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 27 Nov
 2023 12:16:21 +0300
Received: from eps-mbx22p.hq.corp.mos.ru (10.206.152.29) by
 eps-mbx21p.hq.corp.mos.ru (10.206.152.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Mon, 27 Nov 2023 12:16:26 +0300
Received: from eps-mbx22p.hq.corp.mos.ru ([fe80::4d2e:c957:d86a:ce18]) by
 eps-mbx22p.hq.corp.mos.ru ([fe80::4d2e:c957:d86a:ce18%16]) with mapi id
 15.02.1258.025; Mon, 27 Nov 2023 12:16:26 +0300
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Migrating from NT PDC SV 88 to Samba PDC
Thread-Topic: Migrating from NT PDC SV 88 to Samba PDC
Thread-Index: AdohAmeuS9xyJG80SWeKrnas0Ueg7gAACdpwAADbyCAAAxdEAA==
Date: Mon, 27 Nov 2023 09:16:26 +0000
Message-ID: <e1eb97694554458cbbb80845260ef4a8@it.mos.ru>
References: <f93407d8fe144b3794c7d7237abc1eef@it.mos.ru>
 <f36571866e9949fbb1735496100dd415@it.mos.ru>
 <3e40c93ebe774af88cdbe2336ebf45bd@it.mos.ru>
In-Reply-To: <3e40c93ebe774af88cdbe2336ebf45bd@it.mos.ru>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.206.218.133]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: EPS-EDGE12P.mos.ru, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.11.2023 8:08:00
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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
From: =?utf-8?b?0JHRg9C00LDRgNC40L0g0KHQtdGA0LPQtdC5INCQ0L3QtNGA0LXQtdCy0Lg=?=
 =?utf-8?q?=D1=87_via_samba-technical?= <samba-technical@lists.samba.org>
Reply-To: =?koi8-r?B?4tXEwdLJziDzxdLHxcog4c7E0sXF18ne?= <BudarinSA@it.mos.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We need to migrate our AD from NT PDC Schema Version 88 to Samba PDC, but w=
e can't join our Samba to NT PDC or migrate SID History and Account Passwor=
ds to Samba PDC.

Our company is over 3000 NT Servers and over 5000 Users and we need to migr=
ate to Samba without Servers rejoin and Passwords reset, but it's very impo=
rtant for as to migrate.

Is it possible to hope that there will be support for AD Schema version 88 =
in the future? If so, are there any approximate date of this?


Best regards,
Sergey Budarin
Lead Engineer
Department of Management of Services and Data Processing Resources GKU "Inf=
ogorod"
work tel.: +7 (495) 957-93-57, ext. (77137)
e-mail: mailto:BudarinSA@it.mos.ru


