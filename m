Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07230A60B
	for <lists+samba-technical@lfdr.de>; Mon,  1 Feb 2021 12:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Shw8rJX7mjuDOREb4EQiHtiZX49ZIEF13zjd5rtpGQE=; b=3ohDxFtpZ6EXrlymQ0DUTHqajb
	oCb+UIIitXEI144dvRzto+zDMfuLBUeErXJcr6vKJDlxA/Sa1pBmADQJ3cYFfiyNil+XDZYjioLMB
	YWGUfVZPfFXjGqN2A3Gq+VEZ/r1dpBOwNtQux1c36T2SSB3sJxwoY1VtQRdLPr8h0mmMG7Me6fF69
	ji984OqR6TPgGFWk7a+7EdGXTdcSey1SExzo217zZBAtV36V7y/GNvsdfabI/2aJjlnE/s+aC/+1S
	T6pLVZ//tj3qnLLavaK1G7GGljpu5BIWFZJy4mdal9HCPcLnUdbi6GcQV/Hm4FXjAK7NfaXRyNIES
	2xgEpJ8A==;
Received: from ip6-localhost ([::1]:23158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6WvF-009xok-RD; Mon, 01 Feb 2021 10:59:09 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:26317) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l6Wv9-009xoc-MV
 for samba-technical@lists.samba.org; Mon, 01 Feb 2021 10:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1612177140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Shw8rJX7mjuDOREb4EQiHtiZX49ZIEF13zjd5rtpGQE=;
 b=SdGqpn5mz1GPb0tKoyqxyudT6WA0tXB99EPe4/16coP9ocpO1/4uc9oy8Bn1t3jQyWnJc9
 /xWRGRdOjnMyMbi166P89bnxeVNe0BEIZwUtpCc54DyG8/s+5hspZ8ZbMUmZ0I+HjgEVeb
 Qcg77hj0b9Xj1IJiONex8cB4AA1kKCA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1612177140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Shw8rJX7mjuDOREb4EQiHtiZX49ZIEF13zjd5rtpGQE=;
 b=SdGqpn5mz1GPb0tKoyqxyudT6WA0tXB99EPe4/16coP9ocpO1/4uc9oy8Bn1t3jQyWnJc9
 /xWRGRdOjnMyMbi166P89bnxeVNe0BEIZwUtpCc54DyG8/s+5hspZ8ZbMUmZ0I+HjgEVeb
 Qcg77hj0b9Xj1IJiONex8cB4AA1kKCA=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-7BJo_QXGNVyxrkLqMLDSGw-1; Mon, 01 Feb 2021 11:51:36 +0100
X-MC-Unique: 7BJo_QXGNVyxrkLqMLDSGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVTC5JMNS1hO9TS+76M1rqrJ/wpldkqakHKnUvWnK5Tw9o92hgUiKPA2Pl0H4nnY0mxo7xaQQPtN/i18YXhUT9+0eqvTYhoB4lsx+F+cmjwXd9vAw4QspfuFlhb1ucIrBYHx/iNgCXYzLVENLtHdYViQY7JejQb/mTW71MM9KYMHQqBeoI/IRqQnszb5TkHe/YHTMp/prPl96tMgs6ZrR1BSbKAvYXU5J8SL0xSOqPTsStwpOTytnaiKgZUNUGPs/lpX5dzmBE0FrEPVtWYSOWoVF8YOWniSJcXfw+tpArA8z1cuNQtTcxChA53IYYr1hoJ+W1z8b1U1XcmQCi2gVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Shw8rJX7mjuDOREb4EQiHtiZX49ZIEF13zjd5rtpGQE=;
 b=iD9TxYJwh116mCrWmYilm3K4ZtzeBzdOZLk+JkS/RdfCKnjXbLO/2w9bjgFxnlPp3bKyiiZa3gwhPtZzSfqyWxQha/JE9DxScBsgg5Ay9++3D6huF3HxTx+OCboOb40LSK82b9gpUKUlTGQdh3WIttkyhv6mA2Hz/BRUHoURn9r06Tq7COCwn6Lbl7B17uY11nEkXwlvV1VYpEqAfqxPDTWF0TkFnbNIwbom0tF/JIJRNPA0z9b519DJodiIDHca0BT66jBrPMGdi6QHtsVikAlsAgUSAPfP1PZo80hqOBpO/j2JGS+UOyOFycH9wp9T/Bc37tCI6jVto3TUdeTJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0401MB2576.eurprd04.prod.outlook.com (2603:10a6:800:56::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 10:51:34 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3805.022; Mon, 1 Feb 2021
 10:51:34 +0000
To: Shyam Prasad N <nspmangalore@gmail.com>, Stefan Metzmacher
 <metze@samba.org>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
In-Reply-To: <CANT5p=rV-KhHtahaF-9YcM5X8jDMLbCx-szwLiZvACRt1oCyow@mail.gmail.com>
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
 <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
 <874ko7vy0z.fsf@suse.com>
 <CANT5p=o07RqmMkcFoLeUVTeQHhzh5MmFYpfAdv0755iiGbp1ZA@mail.gmail.com>
 <87mu1yc6gw.fsf@suse.com>
 <CANT5p=r0Jix9EuuF8gJzQBGHLp0Y-Oogxzju7_2cJog_jF2fjg@mail.gmail.com>
 <874knolhpw.fsf@suse.com>
 <CANT5p=oTTErJk240GKc+k6Cihqks+9Nnurh=MdrvgC7gqKu1ww@mail.gmail.com>
 <CAKywueTr9GHbzg65s12BRKNB_L881wFLmHcb5boFxGX2AoN40g@mail.gmail.com>
 <CANT5p=rECwTZgskdXUr3VAHWA-PkYHEXX=qwO8PpVZRc0=pOKA@mail.gmail.com>
 <CAKywueTuGuqT8QN-8Jn1QNHT+HPKysLDhdp1gPsm6+Q0tQnbGA@mail.gmail.com>
 <CANT5p=pUVucG6NhzfziAjsjDnimHCWDUiJP46DYoRqjpXHegsA@mail.gmail.com>
 <0b80c61e-3953-e627-9818-8a8c6c50499e@samba.org>
 <CANT5p=rYiY0xE-35swsFKVitZD2yTchRiReyA0wVvY+mU_qKEw@mail.gmail.com>
 <CANT5p=rV-KhHtahaF-9YcM5X8jDMLbCx-szwLiZvACRt1oCyow@mail.gmail.com>
Date: Mon, 01 Feb 2021 11:51:32 +0100
Message-ID: <871re09i2z.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f12:fb7a:e8aa:e796:34d1]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f12:fb7a:e8aa:e796:34d1) by
 GV0P278CA0033.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:28::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 10:51:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49dbf935-8c71-4bfc-278f-08d8c69f5762
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2576:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zTGZd2+e4AvH3bcg5fF54lEB85JQvYigYfQdcZazjdAS4qFfeJYubqZQ8rrveGhPZ6B89Lp+7QWEE/CANJN5xM92ZKP5p4WaCY2T3OVLTJnbnbrOWizi5EMpXB6xPXsge06LCv7D1MVpxDIfOC+AE+Mo6ObuaMrhlkDufFu8YL2QdpbpOTNg0BZ17lnY3WFKYC96vUTHOSOec5tjebe6sdTDERBjEbrEsFUj7MQLgbPi90jpTjP1sxlbqHqCq+tfe7+/ovsoB8icc4EJtvdNFUPlJ28nco6uVT38MY353sJO2GX+fBHV0tj7x2IqtxbBsJF8rN1G0RJipdhew891uPAGIlgiwy/XaZm0V32XcE2wcJrzIpPUBCZchxRxkFIWIZJ6baVxL6fJpX1a2Z8qpoY2pH7Eri9ZNObnVsbtHKNxu6o6rFx/1SWJo2bXbjiIibMFF78OY1+J2qywTTJLEq1GH2E2QqOhdE1dtSCcF4oFCJ7i3SkITZVgHEwFln2BF211CMqoasXQSLZbtnt7BQ==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0xWczVQQW9sbTNnZDd0bjl5UDd4TTRrWm4xNDNabE1qTWJ5Z3lJRWVHNXFj?=
 =?utf-8?B?YW13R1FWUFRKTXBJQ2IzOVdnTU9YbjZSU2lzNkVXN1h6K3VLMzJoNTArLzJj?=
 =?utf-8?B?dU5uZURuMFlOanBzREhCeCtGaTBNKzc5Mjgyd2E2ZlkxYnlhTGF1amdwRXQz?=
 =?utf-8?B?RGhkdFFZRnNFM3FhblFFcFBET2ZFRTlBMkhsYWR3aEtCOGtCblhuR2JBSUor?=
 =?utf-8?B?a1ZiSHQ0dERwOEF6bS9TTVVkcytQNWFUSldUb05kOE54VHNNbWhBaTRRNjhC?=
 =?utf-8?B?bkVKWEFWMnRYZm1zWVdrdEN2Y0QzUkhpbWoyeWdWNjdtY05nSGwzTWRuQnBK?=
 =?utf-8?B?UldObC83VWVzTnpMZm9vK29YbFgzbmFpck5CK3lQRmVjcjNCb2l4NEd4dVE0?=
 =?utf-8?B?ZE5mRUNTcVlINjhlZVJQOTBWZFcvSkJnRklkSUE1SGVTendIbzJkK1Vick1q?=
 =?utf-8?B?cXVabjEyVkw3Q3doTGV6dC9KL1JKNUVwcTEwaW12RWx5ZVkzdWFVa2YzT01s?=
 =?utf-8?B?M0xES0VGVkgxUGpZRWpmZEFGWHVMcVlnOEJUZm1yM3hTUmJuQ21HRmpDTTla?=
 =?utf-8?B?QVNMQmhyRmJPQWc4NjExbU83V3h2YVRwWWRqUkFzRFY2ZVJYcjVVc0s0NEEy?=
 =?utf-8?B?L2pIZzg0U25tTHhMNFJyWURtNU83V1FlZndaaklyQWZNVGpoSVEybEw2aC95?=
 =?utf-8?B?dXhjWk5KTHZweWJ6R0plWjRPdzlMeE1vRllicnRoaTNZaEJ1S1BjZGpUaE5C?=
 =?utf-8?B?RXBwUk1mSkg3alpyMG1HQTNCcHRkUlorZ3RmTlpRY0xQTnhaNDd3bDBENWxl?=
 =?utf-8?B?T0FudGsxc2trUHNDK2RpUmxDdUNndnV1alVyU2d0V0FvbmNLc2c4UUFoSkwv?=
 =?utf-8?B?c0lmZ3NUeEw3OWwyOU84OHVLcnQ3b1lXYW5WbVJFT2k4UVhlTENPdzlmaXpi?=
 =?utf-8?B?bkcrdjMrTGVrcGNsUEMydXpPMzk4TnM0Wm81ampGczRmUlB4R3pwaXhhY252?=
 =?utf-8?B?Y2R1N1J5aURoY3lLbjRraFNGaTZraStuSXJzNEJsclprOGFhd2pmb29xY0JF?=
 =?utf-8?B?L0QvWkVzV1Z3Y0JqMFZ0VzhvUWI3ZkRjUFdOUFI4Z3VsdnlZUkNvYWJyRUVk?=
 =?utf-8?B?MjdzWFlPYnJnLzArUEhqYkZIaGp3V0JsNnBlaUlGekxaYzYzeDlsNVZkaGhk?=
 =?utf-8?B?VzJXWVdoZjVYck55VkNwNE56UU5ZVkZlVDI0U3l6RzFEeFM2UHRQS3dEMW1M?=
 =?utf-8?B?RjllWURBK0ROZTVSRjE4MSs5K0NYUVNFQnBSWVBMdDI2dno5RHdKcWhpWFBP?=
 =?utf-8?B?M29iK1JvNVh6MjNrV0lSUmhOYVd1TVBtVFZSeW9aZFRZaFFzK0ovUytWWVZE?=
 =?utf-8?B?Q3NiejlNcGs2blJyOFBodElmNmpCTm1NNUN0M1BMdzEvTjRyMi9RQnFOSG1k?=
 =?utf-8?B?enQrUFh2L1NNcWpBcjIwS2tHajFYOG80RUVTYVJWY0FyN29yd2txdU9nb3hI?=
 =?utf-8?Q?Of842rLsI+sgH8mZQBd/+nEPRtV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dbf935-8c71-4bfc-278f-08d8c69f5762
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNfdyquP3tqHpZjKChp+kaKicatmpprZL2eIaWp+WKxHJ9k4cyp6gJruJiFILQ7N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2576
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>, sribhat.msa@outlook.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:
> It just occurred to me that integrating with mount.cifs will not
> suffice for a multiuser scenario.
> It sounds like we need to modify cifscreds command to have a switch
> for cifscreds command; if used in krb5 context, instead of dealing
> with kernel keyring, we authenticate with PAM (for add) and call PAM
> logoff (for clear).
> If users are then missing krb5 tickets (logged in to ssh using private
> keys), they can call cifscreds to get the tickets.
>
> @Pavel Shilovsky @Aur=C3=A9lien Aptel Please let me know what you think
> about this approach.
> If you agree, I'll start working on the patch.

Hm what happens where there are multiple mounts with different auth type
on the same machine. e.g.

//host/share1 as userA in /mnt/1 via ntlmssp
//host/share2 as userA in /mnt/2 via krb

cifscreds should change both no?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


