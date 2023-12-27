Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5781ED03
	for <lists+samba-technical@lfdr.de>; Wed, 27 Dec 2023 08:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hvKe0bRekDcm3th9JmvL9WjNz1wDKhV20IGG+RQxKJs=; b=luMB/IQcx3E3UKPdXcFDRGxEvY
	CqgKILSsvzKt9zQnmKHdK4LSchOSuOQSrY9hq2tJzgulZPf7+ToQEdgLB4FY8EKAwJqbfoLZDPL8h
	c+vwAjLBbGRVqMfbnSBI/igNkAOToIEB52l1GFCOqWbFTkA23G/NJYAQAW1CCG9sgf4onPpr40dqh
	66xsZUVUy4dE56QYurjoACRraHTFU5PusI99mUlwfxs/CzRVTSX1/ltbHdxRyJKPxJLByRQpbc6aZ
	Fz0Ny3cJRNVapIDoauCGrLumpYZAN+zysJLLbDkHwdPBU57WQXvP76S4XDgPnFpLJ91zbB/lHxp9f
	PpDCTBBQ==;
Received: from ip6-localhost ([::1]:21598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rIOXW-0095lt-7z; Wed, 27 Dec 2023 07:41:18 +0000
Received: from mail-db8eur05olkn2082d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::82d]:10976
 helo=EUR05-DB8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rIOXP-0095li-PR
 for samba-technical@lists.samba.org; Wed, 27 Dec 2023 07:41:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZhMQagi0ly7HLfj5QvoRvpuIkFcfFP9/dxPd/Wod+LwpdvoUxBPW7tqjhvvqCvRuwsFpvumEmaBiq0eMvMMaJ+N02QS3H8ddISt9cBmlw3TEwApgbPRbyhv9NyMGYi1MsVJlVhy1MMNPG2o820BP1UG00ctrN16juKOpMbptjUyx+VqpaGk6LNfZA1n9dPPVQ0J7K6zCjK/ix5Lh/psTBXyaTdLddDQ+7X+DnxNIwnqkU+luo3XqQMDni1gINdZxZHxUEO1Tlflf0UPDS/r9+7+wuDRx67erc+snSPBlh5wElzcGEBK13BlsaSyRammYYOEorIQPKZBoud4c9eYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCuL1Ll5143JaJPfPUuOD+To0d/XOqD9Ri2K2wFVo3E=;
 b=DNaRoPiG4t9i7N1s8ZHvBt++CZJR7/2KS8hXkNk2gc4ELIYJIOwCyMNP+L2Kq67F7NvgHqAJ/rH/dTicxHrF3KpWSXUTOgLgAcJSR+WWuOk1dw0FNfUI2RRkDxP26KeY4mgIgJEYUELJXB42lq3qBGtbhqJTAWvG9cN4PTX4XM0hQJ0o3GgYt6sLlGtI6nvG5nDNZ3Od8lrj5TPV5I4Digo0eETU3dFQEPsBtWW6kKPy8TaJGHDyUxDLrYFYtYPO1xcRRcpoYACtghdotDgnOKZ1qTJ6ZcctULYDHvHvzBITV0JfWmuApcf+6EHTSL6pImMcWPBGUAeimj+lLeTOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCuL1Ll5143JaJPfPUuOD+To0d/XOqD9Ri2K2wFVo3E=;
 b=AYYQPMKe3tXS/JVusyEAQJSwNGa4nphSwPf2SKHiF/8D6m0jGG3/jP47h0XXWr8zDOpr2/0lBpq9IdLrrbrt4Y81hUxZCuuefASj2DxcaD6C8J88HQFFUQsOr5TnRTEgK0s8W4I12N46A6+IW6BkBle0N6APglOzcN7Ib2pJ45KXDpJLoGD5euMURegpy0IG3dU+JV9q+rfdXGnLoba/g3w/o/wcoi1cqKGg1FCGARIA56hsj63leQswP11WcUmF8XQfwIBpBkMLi284rnkww3lnb0R1qtjlua6mVMFwvnnKLeAc/sjokps7yskTNlD/7IoAU8Jen2TFY91NYtrF4A==
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:390::17)
 by AS8P192MB1824.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:52e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 07:40:57 +0000
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::f84:4c00:b5d7:32e0]) by DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::f84:4c00:b5d7:32e0%3]) with mapi id 15.20.7135.019; Wed, 27 Dec 2023
 07:40:57 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: CTDB and per record persistency
Thread-Topic: CTDB and per record persistency
Thread-Index: AQHaOJfcgdPVrr0z7UO2fkgP/Bojvw==
Date: Wed, 27 Dec 2023 07:40:57 +0000
Message-ID: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [FFMD+h6TrestC2IIflfl2jhj4UnSDQE8KdswYWtxhDE=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1684:EE_|AS8P192MB1824:EE_
x-ms-office365-filtering-correlation-id: 12e35b24-f8a7-4d57-4b45-08dc06af2a26
x-microsoft-antispam-message-info: BWE6N7gYwZhkr3kcyAYaRpp3fqUohsZJTacNKcxz1ycAZZNcGDqo6HI/8ANG3qgTcRKs49OGkRidja/YjOq1ykQeZP9rm5wnaPIZtQWdAURCAGLHh3dU9KBZ7guqN8Wnk4m3rGQqWG+WWhA+8GDbI9PcgFgLW2uakquF7bTdmxGhdotpuAl313iWteq03+lncJ5x5QuL1d+H1KnqLE+1v6O+/Jqmz7vAUPWpub1jWgDpVV9QlYgn7sZ94T4o9/BcpHNVimsdHCps+g9cYqdunut55f3bMMCxWbm20T9WfE+0PK3jWNHNesvIdx8g+kqB7zbSZo9wLqS0VRjVztAs8IFV4UNE6xhL8SueZxooCY8PhIOf8lMvxmR4ShwpSOtxl1HpQsHiLQA1h4bAeQe79mGArNtyhr/q8XHdP6zGBmqmKNNKTAiJdNwQWjQ9SQ1UdsznLVehCOVn2/Hja0K72+Inqjav0ZsE63p7ZmwD2fMVlLUB1VLrtCxnhTGuaEBERHBL3iHrt1winmr3KBU1w1SsZTuWPMd7npPTREn41QgFJKbDWucMN3p9Fhzg7L0h
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzA4MTRvOHlpcmlxZEF1VXd6WnNQMXdqV3d0Z3hLR0Z0NktKajR5RE5JQTcy?=
 =?utf-8?B?MXhaNFRLcW44dmJsQ2xRN3d3Wi9JVE12Uko1dlVGQ1U3aUF6NmFLN3RIa2FD?=
 =?utf-8?B?RmF6Y3Q5ZkRlYWR5WXpYTGo0ZElHQ1JZU21PMUhkQlR3Mkp2SXNjMTBWV05J?=
 =?utf-8?B?a054WXl4cmtNbko2TllpYTVJR1F5Y3RHOUJPTVE2RmFnWHN3MkgyTjJHaHor?=
 =?utf-8?B?bzhsY09zZVpFZ21yRTNOaDgzby9NV3NzTU5ESStOWU5UWXg1WGk1S3ZqVm0v?=
 =?utf-8?B?eEZmcXU3S1d1Zm4wcFBPSTY3SmM2Szc1SGdHUlA2SFVldTRrT1BLQzNualZI?=
 =?utf-8?B?dnlETlgycnEreUlDalhBZnVxS3VpSVRWd1hWY09HTGZvMythMUVTVUVzZWpR?=
 =?utf-8?B?dktjRjdoVGp0blJ2L0pxTjl6YXZtNEJjUTZIT2hGeEd0ZzNTUXNKQ1E3aDFa?=
 =?utf-8?B?ODhoSnpNODA2UU5ZeEMzdlA5UGVTOHBxeHUzS3d4QThWWEdKRXI2dFR4ODZz?=
 =?utf-8?B?Q3p6dFlScHMyM2c1Lzd1ZUUrclVRaXNHNm9CSnZMZmREdGJhK0VQSCtPMklC?=
 =?utf-8?B?SlFnQk41dnEzbG4zTmREeEQ3OWJPbEVKR3huWEcyaXJmTEEvbTNObEhWSFZo?=
 =?utf-8?B?c2RsMW5mbE95VDdZemw2Nm5rcXl0aFltazhXYVlVcS9xVUVSUEhaVnI3KzhO?=
 =?utf-8?B?bHI0RTJjSUt1ZGdhL3VET1gwSjh6U1FPYUN0aWtDRlUxd2Z3SDE2bE9uNEtO?=
 =?utf-8?B?THR2NHFDYmJvWUV1eDVFR1M1Rlh1YVNCVnM2aFNnYndIZFdtVStMQUcwNW5n?=
 =?utf-8?B?U1l1NzdBYzNmTmZsT1dvU0lFMDZaSFVPUHpxZmhoemhzYUFLR3Ziayt1azcz?=
 =?utf-8?B?VjVzNVFid25taXFkQURUTkR5dkhnT2hPdFZlTTlsdm82eDlyUWZkeEZmN3hL?=
 =?utf-8?B?R3Q4eGt2WkgxdnVHejVTakFNVXdqdjlWZmp4WmJJYkRTVUdNempVUlhnNHk5?=
 =?utf-8?B?MWxqa0xDejlqSDFIUUZacFpPNTZBSGZYU0hUWmtlRlJuSFF0Wm1BL1FQcFJm?=
 =?utf-8?B?M1ZSeU9pUHQzMlNaNTkxL0l1VHF2c29jR1F6VDBDNFFLYjVFOGhzbkdheHlD?=
 =?utf-8?B?MmQzV29UYjJuK0NaUGtVeHF1NnBiVzRQTy9jQWpNZE01TVFPcStrUFRGRTZz?=
 =?utf-8?B?MWY2M1FiSEtackRqa1YzMkhhMGVuUmE4cy8vZzduc01INDNnZDlVUzl6ZkV5?=
 =?utf-8?B?SG84K0pSQjN4clM4SFlVVGluaXRVa05wSFJ6WHluUmw4R2VIQmpydDNzUGhz?=
 =?utf-8?B?aVB4aHBnVUFYYjAyeFdlWmxwRk5jdGloTzE2czA5U1cySUZZUEkvOURFSm9k?=
 =?utf-8?B?M1RoTFE0bGR2QjhMYWEvMFUzZmM5WkJib3cwSGRUR2x1b2dNMjNmRUM5UjRu?=
 =?utf-8?B?czg3RzBIR2lJUXNkdURWbVFPK1V6NE1FZWNvRDlxRG5TWUJHQXZYbHp5emdQ?=
 =?utf-8?B?OWxaY29MNUt5V2l5clprZXoyS2s2bjg1OXJaZndQUllvL0R2NlI0TmhGYzZY?=
 =?utf-8?B?SnozZ1lRMFR1MWhwMC9pRkJ0MVlndDZOQ2ZzWFJpbnQvVFRiekFzbkVrR1c0?=
 =?utf-8?B?T1VrYVpOQVRYQWpENzZFUDhvWjdTSlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e35b24-f8a7-4d57-4b45-08dc06af2a26
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB1824
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e1a::82d
 (mail-db8eur05olkn2082d.outbound.protection.outlook.com) incorrectly
 presented itself as EUR05-DB8-obe.outbound.protection.outlook.com
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
From: =?utf-8?b?6ZmIIOaWuei/myB2aWEgc2FtYmEtdGVjaG5pY2Fs?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8gLCBJIGxlYXJuZWQgZnJvbSBSYWxwaCBCw7ZobWUncyBzcGVlY2ggb24gcGVyc2lzdGVu
dCBoYW5kbGVzIGF0IHRoZSAyMDE4IFNhbWJhWFAgY29uZmVyZW5jZSB0aGF0IGFtaXRheSBoYWQg
cHJvcG9zZWQgYW4gaWRlYSByZWdhcmRpbmcgdGhlIHBlcnNpc3RlbmNlIG9mIGVhY2ggcmVjb3Jk
IGluIENUREIuDQpJJ20gY3VyaW91cyB0byBrbm93IGlmIHRoZXJlIGhhcyBiZWVuIGFueSBwcm9n
cmVzcyBzaW5jZSB0aGVuLg0KSWYgbm90LCBhcmUgdGhlcmUgYW55IG1ldGhvZHMgdG8gaGVscCBD
VERCIHNlYW1sZXNzbHkgaGFuZGxlIG5vZGUgZmFpbHVyZXMsIHByZXZlbnRpbmcgZmFpbHVyZXMg
aW4gdGhlIHJlcGxpY2F0aW9uIG9mIGZpbGVzPw0KDQpJIGhvcGUgdG8gcmVjZWl2ZSB5b3VyIHJl
c3BvbnNlLg0KQmVzdCB3aXNoZXMhDQo=
