Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A421C6F078F
	for <lists+samba-technical@lfdr.de>; Thu, 27 Apr 2023 16:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QbRZf/PVnlE43GzEtao/ogzuyANbecVEVSOs5RoMUvM=; b=aEQbBua6KncRZhZilLko4KdP7h
	NZDKjdMN+miwRQKKp7HBPeqYV3ZqfcZJrY63vMS23K1HS4IczrFgYw8uGRQIoTQmXiGYvru2bYTeR
	/iroTbCPF/X8sYnIsuFJrxdXiE6TYV8JBv+1kDMdnw84CcrQPcHZQ+yqTkDXW/s8Bqon/nQ6EErKZ
	IrPLhlWSPZGia2cKn233kqe7KiVQG+oHCEFpqL1s6fWDlywg/9kIJ2ZrNJEqn2m5mUmAUeXla0YXa
	a2kViA+jnzaPjMWMXQJliX7exuvy4mEgahKn9wjwo9dt8y7JypD0ZnKbCqKk6gKxBVjcOAUMifSGP
	TougIh7g==;
Received: from ip6-localhost ([::1]:38690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ps2hH-004wcn-IW; Thu, 27 Apr 2023 14:34:11 +0000
Received: from mail-bn7nam10on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::721]:44769
 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ps2hC-004wce-5p
 for samba-technical@lists.samba.org; Thu, 27 Apr 2023 14:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOcB6mV+pe0wZDDtbHUXOh5e+hyldcvwEcGQYKPhyEnonyMZWNo95fc7EH8ghBL4yU88uZGfRAR3eMxMPdiAVLXU2wKAqDMFgL2wy0nV7WZIGrgUe6EeE+hgdMlF9W6bgincXq6MrZo7tHMvta6XnSY/mRnXEBsr5wBVsBjXg4Ttcl7QV3bhO+nnGw9ei7x66Pin+OiEyl/KztG2H9NzKMDRHWoZY91akSaBi/8hRU19FNIkd/8uyNfWy65dyCZXSb9dh7ok4hiBiZHdJPyXYwfEe9YjvcK6VAXvMTRZMN3m7oox/cIK3E5ozXxKLPD9r2IyfP2MEKfViFVuXNTryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbRZf/PVnlE43GzEtao/ogzuyANbecVEVSOs5RoMUvM=;
 b=U9OSkTw+5iPmVYnTZbkb6ob84riL+f03QaczlnNZV85GYIKl++ZMhdPIDdE8AI+knJQ3ynYaubM/qBryjo9TXsNE6hHotyUV1nY4WRG7Nxn4q6hHW1VOKaGS16hd1bCTONnx7SzC+zj3rFW3p7H/cZjNRkElXUQeLix0Qnz/oidVqR4RCk4vngTS3xXm3++C1aOnH6lKA0zKhIGruOakpqneMs6WHeM2/FSEixO6gqUcxrqlnC05v1dwS4kSjYE9yzqCfjtz8o+2Jtsar8BHho3AluW7YVSVKt9GUTMpJHQZti2JXswnSw5DVHyJ3DvwWFr96YrIicA9WtAKgtg3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=miami.edu; dmarc=pass action=none header.from=miami.edu;
 dkim=pass header.d=miami.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=miami.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbRZf/PVnlE43GzEtao/ogzuyANbecVEVSOs5RoMUvM=;
 b=K+tCiFOb1+sHDqHS1E0CfHiHFH+z4gOOMq+hlomHEsMmAixyis2a4wris3ZK687mOJUrPbShBKdOoHtq8ran6ySn0Seh76/eoe2QXKuujVrI+pgGHQc0GTGAR9TfNGmJ27PkwaIfotmp0yGQPZLKjRkekT/XnGfW+1Lrb64BIo4=
Received: from BN0PR07MB8262.namprd07.prod.outlook.com (2603:10b6:408:115::9)
 by SA1PR07MB8674.namprd07.prod.outlook.com (2603:10b6:806:199::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 27 Apr
 2023 14:33:51 +0000
Received: from BN0PR07MB8262.namprd07.prod.outlook.com
 ([fe80::d30b:a3e3:9d3b:8144]) by BN0PR07MB8262.namprd07.prod.outlook.com
 ([fe80::d30b:a3e3:9d3b:8144%5]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 14:33:51 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Thread-Topic: [SCM] Samba Shared Repository - branch master updated
Thread-Index: AQHZeRVJ+eowHi+OB0agmf1eTqmU7A==
Date: Thu, 27 Apr 2023 14:33:51 +0000
Message-ID: <c832a96d-0857-84cc-7dde-7ed837526453@miami.edu>
References: <E1prxt3-001187-Q7@hrx0.samba.org>
In-Reply-To: <E1prxt3-001187-Q7@hrx0.samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=miami.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR07MB8262:EE_|SA1PR07MB8674:EE_
x-ms-office365-filtering-correlation-id: 7f889943-1497-49f0-4b31-08db472c6bcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: LLBhT1E4pA0iknHDsaEv7w51Z8zhPkyVV0f7BxZFiYdSVm4Cpm8VVRcTftpueHDNRNYeS7MO7z+zI33CCtfKFvcYr5ziSvKlGgHKi0i+oaiave9Zs5Ox+sSzz2x0GJ587rUr+EcAtGJOgFEIRbJUZb0v4FWL9rSjbkJZprOUWU/giIVC1DhJ4M8KvOwNa3VVOogy/yOD+nTjmtk2VFF5NP94d8mXJpCLnwWlmVHVkV1IrUEtAwXsU7uMpNV1Z07J5x+xLWjJVIrkT4FEABrcThzm3+TqYdD0NG96ROJybtsH8ObPbEdkQLXvaSLv9UMMcRWjHOPoKaI2Yt9xc1MOqHYaDwsyYgA9NLIKqdYoeYTgDVVIoidcBwHZSc49jG33jZprN64/VSTqQFN7C+Omwn5o1GZjH7E+Hk/XQOj6/0EM26U+GHj0yN3YK8UDWeSprbtecJ0WhLWsHt3nCR7MI/jQSzRogcMW3fPKJOGKVdBOLDXYsFBb4UFTmD0YULctyPGMn5GaHYxmkzif9Y1YN1j0B+w3hWOYTvTeu4D+l+T4Oe5i0y9lrDJbfpWJmlLzpsUeSBDUWYw8z37Mv0QSUpREVah1R4MbxeijMrJLZx725sheCzhWofL3I3Hw9PnjiHu46u2WWQpf8FQtVwQOQ3F6cAM59JxcMkkEgvcjtVcbwXXBuoJVXmDVBzAiASES
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTdOOFU2dW4ydFlFS2I5YTF0TlZKNE1ubmM5cFpXSkNYVFk5MXdCak0xOFRS?=
 =?utf-8?B?UWpwdVZIQUZ5dlFvUzRJbUc4cys3d3A2c21Kb09aNFduUGR2NnpGUVIxbTBY?=
 =?utf-8?B?NUthSGlXazBtL2xmWTFSSlNFc3lJZ1ErNk5tSWRxaDNnSmliN2FaR1F4d2dQ?=
 =?utf-8?B?T0hnb09Ca2NMdXFGMmw0M215cVFYazExUE1OMVIvTVRZbS9QalRyL0pnNzZs?=
 =?utf-8?B?YUQ0N0pqKzFXR011elN6TSs3WTBkbnBlQjhzS2oyUGVjSWZsdHNiV3VsY0pt?=
 =?utf-8?B?TWY1Q1gvbTBHc3U0Nml3ajEyMGNXb2daN1IvQkVPVk1kODhJU1JGSEV4aHh0?=
 =?utf-8?B?dnpYL285a3orYUw3SFlmU1M0OStjbGY2OFlTMHJKZnp5S1FFeTc0NHN5M3hQ?=
 =?utf-8?B?QUt1NUFrN0RkYzE4dXZxY0V6R0x0ZE9Qc1d5aEFxdzlPb3JWazFTZGtlVTRL?=
 =?utf-8?B?SUFoYUJBL2pNbmlRZC95SXh5NWp5UlNSYmRWZzhueXFadHVGWEVTNVM5TG4r?=
 =?utf-8?B?aDlSdk1GaXk3QURtS1M1QjBnZUkvS0s4RFRhMEtIMExQcjJJYnc4U3l1RFpQ?=
 =?utf-8?B?QWQxTk41azZ3a2U4SW1TMFVrVVdJTmRib2h0VytPZlFSWkYzaGc1RkV6bUhu?=
 =?utf-8?B?RWlTeWtZVVhVYlBnamtadUR0ZFVZaEN0R2pxU2NmbnpmWlhmSDJtUWRVeWtX?=
 =?utf-8?B?dnUycmY4TFRQdVlTZmVKTEJkaHpKVnRndTZ6TStGNmowM0pvb2VoU1VXWjRx?=
 =?utf-8?B?QnlxWmJteEV4SVpOaEdtN2RVUnFoenJYd0grTGRaL1ZJcGd1b1c3SXBUelh5?=
 =?utf-8?B?QXRmMW01Q05Ma1QyUVpWVXhQcGtvcjFVeGxxLzhKc3NlbmE1dnRpb3NpL0pG?=
 =?utf-8?B?amZkcUlTRmlGRUVmb2E2QWZ5SnlTRThuVHhhYllVWFo5Y1NlSXJ2Yi9XWUZU?=
 =?utf-8?B?OERzMmwxejlYSkVKSG45VU5HWnRUeE5VMDF3V1RidmJqcHNmMkh4cjZ2Mm5P?=
 =?utf-8?B?eEVOb28rZi9XSitXa1pGVGNaNWtPaU1qb0dSbGtMK3RYcCszUmd1OWVlb3NG?=
 =?utf-8?B?MkdZSmpyd2l4VmszNkdvdmNCbVlBVmpiRHBwQjhmQktJVUZwWlBiOFNQVjRm?=
 =?utf-8?B?YVdVdHFmQVQxZndFdVl1WGN1NjNXL3d4YU1xVTN1enNFZEVHSXI1N2pwclF5?=
 =?utf-8?B?ZVYyakVySTlQbEEvVTZVbUswVmdKak53eCtmYVc5NVdtQ3RqajJzVU51dStv?=
 =?utf-8?B?NFIrdHpnK3dMVVdqMmROQ2NqTmo3UmRZTjhlSDFFcTJGajI4QTQzcnJXZHBB?=
 =?utf-8?B?YUJ5MUpObUlrUVYrc3lnOEh6eEg4b3MvSW41NWlRZEMxOVZCd0pWZTFSNms0?=
 =?utf-8?B?MGFKZHlwYS9OV2lvdE5rSmNqb2F0czVnaUlCTUgwaFNWd0hTSnlicXVSRHBF?=
 =?utf-8?B?U2Q5d0dJd3paUXNXaDZtSjdkY0EwNVhMZUw1RUxzNE4rNS9rd3FjZ3lPRkRn?=
 =?utf-8?B?R3VBd3drRldpZGgrU3BFLyt3VTlUZkEyN3hBL3ErbU9ZZUJodGVnRjN5MWtC?=
 =?utf-8?B?OGJmcFlnZzZBYXo3N3JQOW4vSG9CNS96eFBUQ21paERwRjZBVFdpeEhKMG5z?=
 =?utf-8?B?ZUdaYlpjbXUvdytJaWFYSXNxcm9yRkh5OGQ2REZYck1zb1B0SDlibnp2NTdq?=
 =?utf-8?B?ckdJUG1kczNNejVjMXYrODhXaFVTUnJXNnM2bDY4Nmo3R1pldXhyakhMRXZm?=
 =?utf-8?B?MHlrTHptQTRhekFsRndzZmlQd2lORUpvQXJWZndITVN5MlFCQTU1dU81M0RP?=
 =?utf-8?B?c3l6d1RTYVhlL2tuZnE1TWpUUzBKMVIrb2VPelZYRSt3ZzNtQyt4Y1dKYjU5?=
 =?utf-8?B?R3grdjJ6eHlNU2w5WlFjK0VlYUR2RHRtQ3RkdEI2cDV1NkdSbUhXVk50blVL?=
 =?utf-8?B?UGNWeEo2Yks3SVhKUU1PdGxDZWNYd1RKNVpobi9lRWJqL3N3Z2ZjakdOR2VD?=
 =?utf-8?B?eHpXMnNMQm9LbUUreFBEVjFTZXNFM0l1SGtHdk9Gb0tzSzJ1dnZuc0hQUjht?=
 =?utf-8?B?WGg2cGlUeVFzbHYzRXEyMmNtYXJFa081Z2ROSFhrTlZkbDEyc1J3SjFJejNa?=
 =?utf-8?B?Q0k5VUJlTE1sbGRYMVNUWExaN2VUazhobzVnY3FnVGtZN1VnKzRsRFczSWtQ?=
 =?utf-8?Q?P+7+9KU4IfURjLbjbKc07+0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A16791449B72B4BB373BBEC96F626C1@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: miami.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR07MB8262.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f889943-1497-49f0-4b31-08db472c6bcb
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a144b72-f239-42d4-8c0e-6f0f17c48e33
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CC6O65MOjviS4+ZhJqxxxBVJI8GFVAo1j4wqzaUCoeBkbV368urVcm3UEp0a3gXdu4fO0O8+6gjB63e3LI5GKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR07MB8674
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8a::721
 (mail-bn7nam10on20721.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
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
From: "Brown,
 James William via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Brown, James William" <jim.brown@miami.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

J0ZvZ3VzJyBhbmQgJ2JvZ3VzJyBpbnN0ZWFkIG9mICdCb2d1cycgaW4gdGhlc2UgdHdvIGNoYW5n
ZXMuDQoNCk9uIDQvMjcvMjAyMyA1OjI2IEFNLCBBbmRyZWFzIFNjaG5laWRlciB3cm90ZToNCj4g
ZGlmZiAtLWdpdCBhL3NvdXJjZTMvbGliL2Fkb3VibGUuYyBiL3NvdXJjZTMvbGliL2Fkb3VibGUu
Yw0KPiBpbmRleCAwNjJjNzNlYzc1OC4uODEyMjkzMTBjMTMgMTAwNjQ0DQo+IC0tLSBhL3NvdXJj
ZTMvbGliL2Fkb3VibGUuYw0KPiArKysgYi9zb3VyY2UzL2xpYi9hZG91YmxlLmMNCj4gQEAgLTk2
NywxNCArOTY3LDE0IEBAIHN0YXRpYyBib29sIGFkX3VucGFjayhzdHJ1Y3QgYWRvdWJsZSAqYWQs
IGNvbnN0IHNpemVfdCBuZW50cmllcywNCj4gICAJICovDQo+ICAgDQo+IEBAIC0xMDA1LDE2ICsx
MDA0LDIyIEBAIHN0YXRpYyBib29sIGFkX3VucGFjayhzdHJ1Y3QgYWRvdWJsZSAqYWQsIGNvbnN0
IHNpemVfdCBuZW50cmllcywNCj4gICAJCSAqIGVuc3VyZSB0aGUgc3BlY2lmaWVkIG9mZnNldCBp
cyB3aXRoaW4gdGhhdCBib3VuZA0KPiAgIAkJICovDQo+ICAgCQlpZiAoKG9mZiA+IGJ1ZnNpemUp
ICYmIChlaWQgIT0gQURFSURfUkZPUkspKSB7DQo+IC0JCQlERUJVRygxLCAoImJvZ3VzIGVpZCAl
ZDogb2ZmOiAlIiBQUkl1MzIgIiwgbGVuOiAlIiBQUkl1MzIgIlxuIiwNCj4gLQkJCQkgIGVpZCwg
b2ZmLCBsZW4pKTsNCj4gKwkJCURCR19OT1RJQ0UoIkZvZ3VzIGVpZCAlZDogb2ZmOiAlIiBQUkl1
MzINCj4gKwkJCQkgICAiLCBsZW46ICUiIFBSSXUzMiAiXG4iLA0KPiArCQkJCSAgIGVpZCwNCj4g
KwkJCQkgICBvZmYsDQo+ICsJCQkJICAgbGVuKTsNCj4gICAJCQlyZXR1cm4gZmFsc2U7DQo+ICAg
CQl9DQo+ICAgDQo+ICAgCQlvayA9IGFkX2VudHJ5X2NoZWNrX3NpemUoZWlkLCBidWZzaXplLCBv
ZmYsIGxlbik7DQo+ICAgCQlpZiAoIW9rKSB7DQo+IC0JCQlEQkdfRVJSKCJib2d1cyBlaWQgWyUi
UFJJdTMyIl0gYnVmc2l6ZSBbJXp1XSAiDQo+IC0JCQkJIm9mZiBbJSJQUkl1MzIiXSBsZW4gWyUi
UFJJdTMyIl1cbiIsDQo+IC0JCQkJZWlkLCBidWZzaXplLCBvZmYsIGxlbik7DQo+ICsJCQlEQkdf
Tk9USUNFKCJib2d1cyBlaWQgWyUiIFBSSXUzMiAiXSBidWZzaXplIFslenVdICINCj4gKwkJCQkg
ICAib2ZmIFslIiBQUkl1MzIgIl0gbGVuIFslIiBQUkl1MzIgIl1cbiIsDQo+ICsJCQkJICAgZWlk
LA0KPiArCQkJCSAgIGJ1ZnNpemUsDQo+ICsJCQkJICAgb2ZmLA0KPiArCQkJCSAgIGxlbik7DQo+
ICAgCQkJcmV0dXJuIGZhbHNlOw0KPiAgIAkJfQ0K

