Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187623157A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jul 2020 00:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=jy1VLGwDg6f1CwtCzSGwVUGasnXZPb/rRbr4DXrlUOc=; b=k+vaC6sdnMpwa8oWjrPbmhW0uR
	t+zlR6zV5ZOQthJqKK5M6QAVoW3oLIBslysnSodc5j2pfNIajL4RBmhVOzonSrEjdzrqsg0lFE9mp
	fN0jynYjvAXj9Zf5DSa4gnJ8xPzRTjRBzqHJXa3HfG34WD6JxRStqJYlVQkEZJWST7WnLhWTmKVly
	pqh6YFDrkBNw9+LrFFrFZGzIBrG/5HBcwPw5fIu1yC6EHYOvKu+D5wNK7w0Y5ntt76uM7mkjvkU/E
	TNaET9gx2cVHaut9Q5lE1ar96SiuITM6bCNppW06GFDGSSvr8QmxjrjhGcEY0KdH3t4OOmjWPAZor
	PlWU/LvQ==;
Received: from localhost ([::1]:21714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0Xyc-00AAqI-FM; Tue, 28 Jul 2020 22:21:38 +0000
Received: from mail-bn7nam10on20602.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::602]:16769
 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k0XyV-00AAqB-RK
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 22:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVDgGDr+gCN0CZpgNS32IT6x+jbY/c3Nv638eKXwaBY=;
 b=XIsvW/VtNpk+a4XNv8L6kZvYx8SUrw57bTyjeemEAJAbrjXDP49imIkZkkfrlGLEu+FJIvbPXUcNv0QWSl/cnwWXvreVLXa1KhZc4SqT/AN0F9/TfMdvTWrfSxHyCTlT9XjKOSOJkBDnUYMXB8X0LUwgaxBcVS5uhldy3KGfOvw=
Received: from MWHPR14CA0007.namprd14.prod.outlook.com (2603:10b6:300:ae::17)
 by DM6PR11MB3867.namprd11.prod.outlook.com (2603:10b6:5:4::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Tue, 28 Jul 2020 22:21:16 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::9a) by MWHPR14CA0007.outlook.office365.com
 (2603:10b6:300:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 22:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 65.52.56.186)
 smtp.mailfrom=storagecraft.com;
 lists.samba.org; dkim=pass (signature was
 verified) header.d=storagecraft.com;lists.samba.org; dmarc=pass action=none
 header.from=storagecraft.com;
Received: from us2-emailsignatures-cloud.codetwo.com (65.52.56.186) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 22:21:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by us2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Tue, 28 Jul 2020 22:21:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhGqWRhZdOPu3En5YMW4Z+jOYGMn4/NHSFg8Ad51qX8Sa2ZPOmgDqTvf/m3fyZ4LubJW24nXRvWZ40HST68NZWX9bxDDInL4G6GKbAsnkv/RYcAupNaQpoX58Pz+MyXhpXvRw6wzzWnHHH0VhQ0dxRohChKwWmwk5g6h8JuENOqZ3GJKVQt7i2rVKN70OVzM/w6/hV9Nwbd8NakNLFi104Fv+s9e8KHivEJBmFYwq2UyKDfVdhIhI7LYT2c4R9biI5C+fbnX1Q5ZrSkXeguxTHSJkDFx2ZAy9p/GDJao7dk5fwQRL1kt0m5VKjV9ocZ3mqd6JxkY+Ar/eQCAxxf4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVDgGDr+gCN0CZpgNS32IT6x+jbY/c3Nv638eKXwaBY=;
 b=e+p7QLFKkgjuxgyPO7taEvgbfE6AwtMSjFTuQv1IRRDPphE0mLEKC2VA6JWiBlZPR0EMTOWncuJwNO31B01ENU2Y9cRJjdGhdlW8ru3k8hlMNGr4GhpJG6zPoIjyQqd3IMTPMyAPCwEAzHP2NON9AYe8TxvoREnjgwts4KA8i+RN+vzT3Jy3qgg5exe1qxaHwAFGJKfzGd9SFe3l6ChKA1HQp7nj5ipazbiro/Y5Jjaw+WBw66M3kre4bt0te2u8L0oUdecI7n+XNYouINJeMhg+vbLuqkz9gs2UjDrxDirWcicXYCr0yfRQRuNqcv/YGKLt/DDlxMLhj2+l7XZvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVDgGDr+gCN0CZpgNS32IT6x+jbY/c3Nv638eKXwaBY=;
 b=XIsvW/VtNpk+a4XNv8L6kZvYx8SUrw57bTyjeemEAJAbrjXDP49imIkZkkfrlGLEu+FJIvbPXUcNv0QWSl/cnwWXvreVLXa1KhZc4SqT/AN0F9/TfMdvTWrfSxHyCTlT9XjKOSOJkBDnUYMXB8X0LUwgaxBcVS5uhldy3KGfOvw=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 22:21:12 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558%7]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 22:21:12 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: UNC vs Mapped Drive connection times
Thread-Topic: UNC vs Mapped Drive connection times
Thread-Index: AQHWZS1m2f9cWoeHOE2HCZhE5ocdSA==
Date: Tue, 28 Jul 2020 22:21:12 +0000
Message-ID: <B08C375D-7730-453F-B11C-1357B78C0C10@storagecraft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
Authentication-Results-Original: lists.samba.org; dkim=none (message not
 signed) header.d=none;lists.samba.org; dmarc=none action=none
 header.from=storagecraft.com;
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 91295466-4f95-44e0-adba-08d833448acc
x-ms-traffictypediagnostic: DM6PR11MB4300:|DM6PR11MB3867:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uFWEYpzv6xPxqJmSrFXJfr6j2uaHqmH/PgqtQWM1q/WYTMgVAkKwKZQnuu8nnqfCwFmtY9bqmmDmTdBynwW6nANsclF/37iJlin80Q0BvLsWPnL6v0AQHfQdhAM+Xu9tn4n7V484Px2QkzedQVd5DX9Jb9YAGQfSCqkNl6eLqF/y/QEZhmQuorxpaXJwtHzElUfQgtImUJjnsvzUZkImTDHeeoSidGcJByw9bTfi6QHJsClfSaaxMH4LYRlQtgWFV/Z9V04OINFigAIg6DHQ94K/+Es0mRtwgSAsd7MTiWTlZ5S+M1LR+3gqLwgZeOQZaFDjjMxbwksDHTx1+PMibA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39830400003)(316002)(71200400001)(33656002)(44832011)(2616005)(5660300002)(86362001)(6506007)(6486002)(186003)(4744005)(6512007)(36756003)(26005)(91956017)(2906002)(66476007)(66556008)(66446008)(66946007)(8936002)(478600001)(6916009)(8676002)(76116006)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4f+dxOY1PozWgEXsSD6ATGRqICZnji6jiDyyiGIhsspDTqxAuhZ8mqKlrwNsv5r+mZnNCh0Wqg0HiurJLl7fawApn5OGx+PTxqx8IdGgCwkMQObxhjqtzY53Yr05L/mI8VduEFGIY2nYgotc/Fm6/+i9+6ffDZR+XpwAx8Bof0Fm9DFHxAHwyHyM7QxBM4MLGUso8tigwvVnat4sDkJlr5SYAz/mvqRTlcGNxCm3F0T3EZqgbZ0p5M0swJyWjZ7ru6Y9A/L8nnxYJCH35UxBu4z8SvyR2QUSRKc/NJDi7Cf9C3WOfQn5LuS7ZaN4wIiaYEzK5pYjLc0G5f6MB9G5od1oAOR6mLO4qnQmUobULtDEkoDBu4dgWcvxVFICGLxex5BVNIkqj1yzUqJ4ps/uQbHomarqqE6r6uW4HUC5noYN6bzuTUMKvVdL1Bk/cbTQ7IJV+LsdQ/yOQbC78Am4FS2EZnqsptylERBADx20bxcy8I/9AxNpCg0+H1dAmCsU
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
X-CodeTwo-MessageID: 3cc5dc9e-004a-4181-8631-a23399faa7c0.20200728222113@us2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9efd0507-3828-4e15-2cf9-08d83344891e
X-Microsoft-Antispam-Message-Info: HmxYvB/jen5q6yhwKo1ff6Qo/inoxorUACTum7c2E+JTv4Q7oStk0CuY8KWWpdOA/JosNB0qZZwEc9+YM25ApXHiH9Uy4XvHLnUHVGRFTh7GgyQjqZZM5UnClNFy4+1wemvFrVH6ZduUgMZOx89PWfyoHhwgYyBNp31usCXFMM6GCpyE4mt6PD3LIXIM3H0V+1zAsXSSQ58nxwuvaS+PE2HsYIAzDWOgvfl1UPWGAHRHPfsBowugwlcJFjx9z74z8anZOJaqPdlRbHm5nytZGd2PIsXWh/P27Ar4rr50HyOLc1LXDDe86Cu/emzSQF6cgvvdj8Kef50klWY/qbu5iAVDaLRlUd86VvoVBq+Y0RjP5boMYcRp8MnagTBddIB2cOczEM/R8i0jBX+Kn4jWmw==
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91295466-4f95-44e0-adba-08d833448acc
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[65.52.56.186];
 Helo=[us2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3867
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8a::602
 (mail-bn7nam10on20602.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Krishna Harathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Krishna Harathi <krishna.harathi@storagecraft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

V2UgYXJlIHVzaW5nIFNhbWJhIDQuNy4xMS4NCg0KT25lIG9mIG91ciBjdXN0b21lcnMgaXMgcmVw
b3J0aW5nIHRoYXQgd2l0aCBXaW5kb3dzIDcsIDEwIEV4cGxvcmVyLCBjb25uZWN0aW5nIHVzaW5n
IE1hcHBlZCBEcml2ZSBpcyB0YWtpbmcgMTAgc2Vjb25kcyBhcmUgbW9yZSBjb21wYXJlZCB0byB1
c2luZyBhIFVOQyBwYXRoLg0KDQpJIGFtIG5vdCBhbiBleHBlcnQgaW4gdGhpcyBhcmVhLCBhbmQg
SSBzdGFydGVkIGludmVzdGlnYXRpbmcgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIG1l
dGhvZHMgdG8gaWRlbnRpZnkgYW5kIGltcHJvdmUgYW55IGJvdHRsZW5lY2tzIGVzcGVjaWFsbHkg
aW4gdGhlIGZpbGVzeXN0ZW0gdW5kZXJuZWF0aCBTYW1iYS4NCg0KR2l2ZW4gdGhlIG92ZXJ3aGVs
bWluZyBudW1iZXIgb2YgdmFyaWFibGVzL3BhcmFtZXRlcnMgaW4gdGhpcyBjb250ZXh0LCBJIHdv
dWxkIHZlcnkgbXVjaCBhcHByZWNpYXRlIHRoaXMgZ3JvdXDigJlzIGNvbGxlY3RpdmUgZXhwZXJ0
aXNlIG9uIHBvaW50aW5nIG91dCBhbnkga25vd24gaXNzdWVzIHRvIGxvb2sgb3V0IGZvci4NCg0K
VGhhbmtzLg0KDQpSZWdhcmRzLg0KS3Jpc2huYSBIYXJhdGhpDQoNCg==
