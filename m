Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 782EA1E7104
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 01:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6Tbpfomuzb1RCJiMGJC4k1pdIALD2MbOnzyrBgO3nC0=; b=vOSwqdOHAzj7VA83wnjHgZSGL2
	FmRpE/DKtObxk1MCoxlsDyStbQAiyqV3odU7ipChoyMq2k0e4yir0PhjmnBhWBL1XS85JM/PU8RVC
	ce2l+ZULsHkCdKUMkYvY9O+5aoWJzlwmVY+clg/9xFGfwfwMctukvH96dYTcf/TiZIsokJ07XmSVY
	iONhMt/PCp8wvGFCB9zL/4K4OZBLQWn8rXA9sxuZkiOEJfe2CwYN1sb3n6XlqG2mk5DtcttAcHLBO
	Z0f90xI8PxCUfGrDjF7VTcCVABLnXO+AD/mUWFEJBw6FCZeEcOpYtvsgkYUHsBrqx6CVYhA2lN8Od
	E8y0kolQ==;
Received: from localhost ([::1]:47346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeSQ3-006HXj-Uz; Thu, 28 May 2020 23:58:40 +0000
Received: from mail-bn7nam10on2048.outbound.protection.outlook.com
 ([40.107.92.48]:6067 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jeSPy-006HXb-71
 for samba-technical@lists.samba.org; Thu, 28 May 2020 23:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWT4M/lJpETSGhEppY5qNo3IJpemqIJrUIDLZ2NxeOg=;
 b=V/DKq8wy4rTu5J4baALXJPgy+wt6UOYKSGFQiC/JoJ15XMZv4q4aJVXSFboQWAbEUptIJJhbedCTvZvyGtDhfYBdsCsg/an3uzV8Yt3GZKQULwOcCD7lZ3wRG0VXRAN2cbd8UXiuJ0MNOmVi7ZJLDUfQdtzSAs1cXv93T0Kg9Qo=
Received: from MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 23:25:22 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:12a:cafe::8) by MWHPR22CA0068.outlook.office365.com
 (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Thu, 28 May 2020 23:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; lists.samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;lists.samba.org;
 dmarc=pass action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Thu, 28 May 2020 23:25:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 28 May 2020 23:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCp/tmDITXickNtIR2AIZtFE7Hk2Wom42Qa2kDSORUXr7l1PAWxNSJangp0C511iL2Jo4erzlXPzshsrogrYHIulfyI3cA1ux9LhpYvApUTnOgg4tm4IZtvD1G+EXAI+HFzhb2d02n3tLyqW2f00PBN6yCpdflZDeRP+lkKYmMsCN1EhB10X4xdR77zkry478ph9JhOIhTgwnKA8dUTbnHVnxpQD+cvk2kOsmGfhV3v2RnDUG7R7y24KRs+pGIe3bFZe2aW6ve3weSd47m9cd2Lk1zCXmoW5vy0FlqJdLDVov52A2w0+fSBOlsYhopYgHZRKC20zC72nVFuAfkCfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWT4M/lJpETSGhEppY5qNo3IJpemqIJrUIDLZ2NxeOg=;
 b=bL67zcLeNXQlBNvirhj64/Zb0j7jIfsQ2ePvvHvYYrQNq9iG8l8FvIwnu3SpMYmm7R1jsYfxkuNe6WrhhvGCDgwzmTApgSH7a4QWJscyIht050G8B8F2Eh8EiCasnsxjOVIxhuO0Ze42+r5b1sELNa6wKnFTRQcN+rvmyWWzuDooWG0bWL1jpNHfugHawkSMntNBfvpef8OQDjdTHjvVpGX73X10f5QhBIiXrgHEm39KhacL5sDMiRLVuAEfbQRtVhmJGuyq9nV5y0vX+iTJIV8iMuR+mFIb0ncKSVS6a8cW/OX2NUBjhzup76mVtwZL7zIU/Khq07OGRwnJBkLyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWT4M/lJpETSGhEppY5qNo3IJpemqIJrUIDLZ2NxeOg=;
 b=V/DKq8wy4rTu5J4baALXJPgy+wt6UOYKSGFQiC/JoJ15XMZv4q4aJVXSFboQWAbEUptIJJhbedCTvZvyGtDhfYBdsCsg/an3uzV8Yt3GZKQULwOcCD7lZ3wRG0VXRAN2cbd8UXiuJ0MNOmVi7ZJLDUfQdtzSAs1cXv93T0Kg9Qo=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB2985.namprd11.prod.outlook.com (2603:10b6:5:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 23:25:19 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a%8]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 23:25:19 +0000
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Subject: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Thread-Topic: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Thread-Index: AQHWNUdA+kJKRM4BfUKiWqZicZITNg==
Date: Thu, 28 May 2020 23:25:18 +0000
Message-ID: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.37.20051002
Authentication-Results-Original: lists.samba.org; dkim=none (message not
 signed) header.d=none;lists.samba.org; dmarc=none action=none
 header.from=storagecraft.com;
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f961f81b-5303-4b08-ef4d-08d8035e6429
x-ms-traffictypediagnostic: DM6PR11MB2985:|MWHPR11MB1680:
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BGAeYvliQn+7Xlt6f5uKlbgS0zgBLAWjyojY/aOUHHly7oeM2C6aJCgbRLTBpQFfz0n8iRMd09BeMmPlPZv3/QDSTnm6GN+3f4Ouxh0UQMsC+Z80wIjuDMz9+jCjte1422fl4+G89r2g3fMNgE3TwlFswffHqG1UPn4MTyBuI5oWLFzKP7t8DowOj9m/kirEB12mOK/JqSjqCmAiALUWIQ5RSQM6GyIdP1+ZkDE6oJDj30XTLI0cEuAc9Iy6Yffupwboo743NG9qoCbS9XXyCzRKh94p2JI8/MJOgdm1W0cxqfa+jpB/cRMuhPIkQZzA8Dki9JP2u83COgJnjZGLPYpiR6Ohi/qbl2KM7vzlN9iVBq8xPh/GfMUc0dMv2+U7Rk/rMeuv52jOx4Iv5nCKuQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(66476007)(5660300002)(91956017)(66446008)(76116006)(316002)(66556008)(66946007)(4744005)(2906002)(6512007)(64756008)(8936002)(44832011)(6916009)(36756003)(166002)(8676002)(2616005)(33656002)(83380400001)(71200400001)(6506007)(26005)(186003)(86362001)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: JChbwekwUDKMzZF0nkrnO7ma6n/e0UIL3aOV1U2Ppm5zV0omDj+H0rW671bt89qTOwKQEpKavq9dQx8kD7fqcCqqRZlPC+m8RTvzciv7b6MDkfreODGL4Ze+jyUGK957TxlbIlP03rsTsIlxWHZSu3C3tFaEgboB6dFfexnqEapTSGyiI7ck49a2yoNaXUoZq5aIGiBwCnW9PudzGp7820M7YkG6EdUnxIl76zA2RpXA9PmFXtYNVAMepvFPqiE646patrTsWtqZWZxBhCesiaNpzD1erJIFBx5ETkwORnvcBf4l/EihZkCbA1ifKjbb1VWEiij4Kwo8zqA0TosDcDfI4B4ldtdu5IDm0mOdgZqoO71Xep6E38f7ug4G07ipEMTQhpXnls8sJboAGXSJISmBvQPsOIAN1kDhQ7Qpu7gWo8umlJuBJziQLMe0AEj9oiCSvGvnmOzPPew/WUn0yinLC6ASbLnnNm9dUn99wMSlMZM7k3Qx9tkn44Bg7dzj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2985
X-CodeTwo-MessageID: 0e778315-633b-4041-b60a-607894dc0d9a.20200528232520@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7091e037-8d7f-4fa8-a2a6-08d8035e62bf
X-Microsoft-Antispam-Message-Info: Pr/v1VHP2pMcjL0K8NwhjFCsFPJJfmPzH3ojqENviM/eFfoj6hZCJ7DlSCvT9uLqI9Os4u3fLOPWOLuvspG4TSb62/lkjF0pLUhAGiPHQ5/nPbrSQvyTFxMgnyvhCvJvp5s4XMjpjvU5oCZ+V/SKITACF7xQMCR1rK8kgwwDWD9UkbPxk5M3PKAZ+bV4Ckwx1TfsKYTGmm7wuHq7uIQRmCjUEdQA/8P5w2UDTOFBLRmlUiRRc9xuAzgDADsQEJT9k8IVsfFxCwvgemVIHTUMrMe8LAxw/halVPqzHkUIB5Z29MlGRyzzrxVZpXkFkAN3SqkFzrFJxy3rzydjygBcj9sdBd1SogQ8nBKN7iqL9UtYIYfhr9gZ71WAXyzTAZ38dRlQMr5qx1c0KY4eexR7IqDYhV00RARaitBAJr/ynTAc/PP7EnNdC9NCVNbVhR34H8IDZMsDg7m1QptlVUmKazOUMNW7ZfPsRe4TauqFhVc=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f961f81b-5303-4b08-ef4d-08d8035e6429
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
X-Warn: EHLO/HELO not verified: Remote host 40.107.92.48
 (mail-bn7nam10on2048.outbound.protection.outlook.com) incorrectly presented
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

V2UgYXJlIHVzaW5nIFNhbWJhIDQuNy4xMS4NCg0KV2luZG93cyAyMDE5ICBTZXJ2ZXIgU1FMIEJh
Y2t1cCAgd29ya2xvYWQgaXMgZmFpbGluZyAocmFuZG9tbHkpIGFmdGVyIHJ1bm5pbmcgNSB0byA2
IGhvdXJzIHdpdGgg4oCcaW52YWxpZCBzaWduYXR1cmXigJ0sIGFuIGluc3RhbmNlIG9mIGZhaWx1
cmUgc2hvd24gYmVsb3cuDQoNCldyaXRlIG9uICJYWFhYLmJha+KAnSBmYWlsZWQ6IDB4ODAwOTAw
MDYoSW52YWxpZCBTaWduYXR1cmUuKSAgTXNnIDMwMTMsIExldmVsIDE2LCBTdGF0ZSAxLCBTZXJ2
ZXIgWVlZWSwgTGluZSAxICBCQUNLVVAgREFUQUJBU0UgaXMgdGVybWluYXRpbmcgYWJub3JtYWxs
eS4gIE91dGNvbWU6IEZhaWxlZCAgRHVyYXRpb246IDA4OjA2OjIwICBEYXRlIGFuZCB0aW1lOiAy
MDIwLTA1LTI1IDAxOjA2OjIxICAgICBEYXRlIGFuZCB0aW1lOiAyMDIwLTA1LTI1IDAxOjA2OjIx
LiAgUHJvY2VzcyBFeGl0IENvZGUgMS4gIFRoZSBzdGVwIGZhaWxlZC4NCg0KSSBzZWFyY2hlZCBT
YW1iYSBidXppbGxhIGFuZCBmb3VuZCBodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTM0MjcgYnV0IHRoZSBmaXggaXMgYWxyZWFkeSBpbiA0LjcuMTEuDQoNCklzIHRo
aXMgYSBrbm93biBpc3N1ZSBvciBmaXg/IEFueSBoZWxwIHRvIHJlc29sdmUgdGhpcyBpcyBhcHBy
ZWNpYXRlZC4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLg0KS3Jpc2huYSBIYXJhdGhpDQoNCg==
