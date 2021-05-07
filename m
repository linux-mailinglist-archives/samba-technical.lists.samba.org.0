Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A71376828
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 17:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=USIqsEtRGEg2I52Iqz6AYpY6fLg3+x5Lz+rFMC1MfrA=; b=dZKesfi3fXfRtRoxc37sZcl/gQ
	gjmfKzagnnLzcIEmhq/prCBJNwpxs5FZfbrEyTDP4qVHdiRpgOuw0gYhYmIXlyRKgrX4r5VY5Q0JT
	j0DkynQ9EKt86V9yvgtdDbGj9H6x+0OCXC10AiqQqszUhQ6Aijh6JGxPqlE1qhFwKfm+4M1NUoPkc
	Xso9kRgPR6qy3znQoJ4wnfoGfHvSfWKVsSO8/O/wwFqOu/adxbVj1joPmx6ZhoAwP6uR6aNgh7dN+
	moXznoDHmkH+ysmTswbDCqTqfXe1FYiMFu5mM8V7JhtLXU1bHgj1IiiMXJtukjxmFI9LL/MaBbx4w
	kDQGkrJA==;
Received: from ip6-localhost ([::1]:48696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lf2XV-00GNam-Rv; Fri, 07 May 2021 15:37:17 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:50160) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lf2XP-00GNad-4O
 for samba-technical@lists.samba.org; Fri, 07 May 2021 15:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620401828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USIqsEtRGEg2I52Iqz6AYpY6fLg3+x5Lz+rFMC1MfrA=;
 b=UyfS+LGkDpVzb5fcSKBaRi6urZu/piz8HynAQJQxGumQv7/eisnDINUzhPE0QUdImPt6+9
 lmmkszegMc0Opf5chyrE8eKhcznU/vNzcffAnfDUQidQm9A/MVTM0WYZxXk3x0OqCz7QF/
 4eSXUKIfMyYOOL3ijTqHK1O7QIVjnMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620401828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USIqsEtRGEg2I52Iqz6AYpY6fLg3+x5Lz+rFMC1MfrA=;
 b=UyfS+LGkDpVzb5fcSKBaRi6urZu/piz8HynAQJQxGumQv7/eisnDINUzhPE0QUdImPt6+9
 lmmkszegMc0Opf5chyrE8eKhcznU/vNzcffAnfDUQidQm9A/MVTM0WYZxXk3x0OqCz7QF/
 4eSXUKIfMyYOOL3ijTqHK1O7QIVjnMY=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-cKw5MSx3OEGqvki7TFz9QA-1; Fri, 07 May 2021 17:37:06 +0200
X-MC-Unique: cKw5MSx3OEGqvki7TFz9QA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7E+j+1S3/aksy0V0Hs/WxH4t0lsd1CL24lbCszMG3Ggo+Vel8dLAIqkoadx1htka9Va1+Pj+dpZ2DpvLmhonRY3+Dhw3Adt/tdSMzve38ToUFk8o9on20fR0jqaX4nLfaU3d133RY6v9sJAxauqIQA9TJ3ZnFJtXS/53R+GTAoNL4f6rEghh8WHd3k65qGM5pG3RrHltpu/MMmH+agt6qJCH0d2yzduuAV4P0yyCkNZkvPOw9o3ORqbV3lPQstGBUdKBFTn/x6F04UvZOztcIygXonZgQEpIrTlMhdfEr7PkZ4jrRRZ6dmMy0PfQNpXgjNBJ+n5mC0ZqNhXh0MxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USIqsEtRGEg2I52Iqz6AYpY6fLg3+x5Lz+rFMC1MfrA=;
 b=CkuBEQ8+6sw/dYlYY515Fo8vi8ZS2Z9EOILZfjpQPcpxUrMfz40DS+bOw7IQEQloCVcNCGnr/Ve+jYSrhXKWPS+ufQyXobk8J3He4k9oZgCQeMjs1qNl1KiGAtcC6IB2xve6eGfys2oSTBxcIN/r3xIhtQnGgP3mKBOO17mSHhVHd2MqSxT9M6W6aIBOE2cYpkDs9GIcxvQEUT7CnYzWXAlwF2BF14JxgyOBkMLcJVRJd3MXIGemzgNUzrgKFmLN7O3OORb3vXOJvl5Io7CvdNeycu0TBE9Xvv2A67i1hD/wcyMJQdA+obdfxwTnwkjSu0RLpkt68i8mUibk5Ba+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0402MB3757.eurprd04.prod.outlook.com (2603:10a6:803:18::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 7 May
 2021 15:37:04 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4108.028; Fri, 7 May 2021
 15:37:04 +0000
To: Stefan Metzmacher <metze@samba.org>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve
 debugging of encrypted shares
In-Reply-To: <1780584e-d602-00c4-6f4b-c112f158148c@samba.org>
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org> <87y2cqu9as.fsf@suse.com>
 <2e20d5e9-148b-dbb2-9fda-50521be46fa5@samba.org> <87sg2yu18q.fsf@suse.com>
 <1780584e-d602-00c4-6f4b-c112f158148c@samba.org>
Date: Fri, 07 May 2021 17:37:02 +0200
Message-ID: <87im3utv1d.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:713:a617:3026:1c10:d670:5fc7]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:713:a617:3026:1c10:d670:5fc7) by
 ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Fri, 7 May 2021 15:37:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e8e6eb-99c4-477f-2780-08d9116df729
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3757:
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7qddcAqThmEj5hGONkP1+dBwHnEwx2lsgA9h4TMnrTjsiJGibPULPDBaOFgertTuLhAIp2Q6n49tm8lVl+cw5yFG5H8rk5sXlUZzd0LA4YtpHYbK0Ci+2Am6HThG4INTtVGxpLGFnLJJrB76K1HVmfBpCkcSGLHXQe3rwmvI9zhTCl6NfmsL60vF6xl+JDAZB5dU6XkRwSIpJdDIrLYecmYc0zZDFFknku21ESyPLzmrWyoByfKcKEcQB1A3EixuQToD+wcQLYPPk7XNpIj/P38Xm9xYcVzPRvr9zH1MREWASMLPnrtebQ1anwS6KCr1RtyDwMVx/vNyjYaeLQKVOir0V9ZwyJjwQPmj+b7zceY7QmnQY1wouMyCKoqBCznNNvjpC1tz1gXGnDjad2STc5Vq3hyTRPwXAMwvTgOxh+nr/CPyOgoWMzvDJmkP/Jv3tmYo8dopKQeOU5N748u7A3XSj27ArAG2h6KlxABvccYsAbC9sPajkyOjQwQsTkc6E08TLMIy1GjFC1Tfr+evmyIfvIKaYkVPD7e04VXTbr5stpwnwJ1v0upRZD6EkQ/GRWo+SOL82HfUaZIC2laPUw==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGFWYnZ5ek9xVHRjRDIrS01oMHdFOVpuYzI4SEh1WFpsSk1pc3ZVRTVsakhk?=
 =?utf-8?B?Q2FsTHlDZGhxbjRuaHMyVUxqYzB2UU45SjdJY3R2dlhhekVzNDlCUjl1Vlhn?=
 =?utf-8?B?V1AycWFMdU00b01kVmoyVGw2MEZoRFRlVnlrc29kV3VKWlc0ZGJuU1BIT2JQ?=
 =?utf-8?B?RWIvSXViN1oyTTl0MVpCUHVOTXYyNUI3aTdiOENHWnRIdklYeVhCVklvRCsw?=
 =?utf-8?B?VHQ0cmkwRWg4bGExY0oyeGJpeVprRUk4dCt0cHVDaHl4MGwwM2c4d3hkcG14?=
 =?utf-8?B?M0xrUFhXdHYwUnF6UERtR1BaRkJVTytORStVWVNhSXl2VTRXajRNYjdrNnZR?=
 =?utf-8?B?VFNZM3hCa0ZMaEZMSGhreWpDQ0VBbUNGa1RlOTFOZ2ZuaTAreVhYQ0lzSE9K?=
 =?utf-8?B?M1UwbXZoNmd4N2EwK1ZZRXZSM0hqUDJrWTU0QmpTS1Q5WGwvNVpVRG41TzAw?=
 =?utf-8?B?cU8rWit3N0YvcS9FY2xRS3hkT2QzbmRyUWFtYjN2TEpTTDN6SnE0S3R2am9L?=
 =?utf-8?B?YXU0cmgvSTU5emtxSGlvVllzZXdFbVRSbzhMd3lSSW5Fam1scXhGVUpZcEoz?=
 =?utf-8?B?YjJKVWhJUXEzM1V1V3BYNGQzbXpzUGhrWWZkdUhUcERzSXBFa1VyVXptTC9k?=
 =?utf-8?B?L1NEemVSaUxZQ0NqM2NtSG1KaEg2czdDTlZwMTRGc0RNQlV0aUx4cFJsNFFh?=
 =?utf-8?B?TWQ5eXgvWS9QTEM1ckQ0NTNZYUNKNGU3OUxCQTExZEd2NGhpendGTGdtaDRj?=
 =?utf-8?B?aVdRVjJNQ29GVXQ1WWtkTnpwMVBJSmlEU1JwNWJ1MWd4QVlyVEUwZ01PTTNM?=
 =?utf-8?B?bDQ5aXRqc2JuR1VxS3poa2h2cTk3MmF2eWFTWkQ1ZWducVdGWnpURmcvb0xN?=
 =?utf-8?B?UkJJK0EzdUV3THVQaThLMjVUT3hNT0JIRGkrdFV2L1JqWlRZTk9oS1hUQ0xF?=
 =?utf-8?B?c3lKaksvTjVjVzRQSGFyNFJWRzlUdWsvb2ZDSm42emZJUzdyZGphUDFVWE5F?=
 =?utf-8?B?T0g3VnBIYjJZcE1scEZUL1NMMFBQcFkvU1ErSE16SVJDSEsydWRIczE3blN5?=
 =?utf-8?B?ZnA0cFBvckg5aStNemFkRW16aU13V1ZFcnNZSDhkaWpVR3VSclAwK05LZlBB?=
 =?utf-8?B?OGJ6RnZydmxEUFJnUnIxek5uWk9rRHFpUEFMMU5TSGI3Tm5MS0JoTDY1UDNp?=
 =?utf-8?B?V3NJUjA1QjVMYUdpYStsQlZJTWtYMkRiSVBFL3pNbFJPOS9xQTUzOHc2WU90?=
 =?utf-8?B?cThUQlAwdWxPb2JHUDdiTE5SbUxXckRXaGdVK3QxYTg3YjVlUmdOM2k3YjN6?=
 =?utf-8?B?am5xM1hLVGdJZ1ZGanNRUWxXSWtCM05vYVRjN21mQ0FaYkRBck13UU52bk52?=
 =?utf-8?B?WnpvNDF4MDAvbFo3eFNPT29JUU9mZ2x2QmN3cyt5VXhvSUlGQ0YyczNNWFRK?=
 =?utf-8?B?K0xTZDFQcVl5aXovL3FHNHdoak5vWDM0ZnJuNnppWEs4RTcxQXk1NGxDZHQz?=
 =?utf-8?B?NmR0YUZ0YkFKRzE1YnZhTG5NdHhyMXRUZHhnMzdWdVlhSGhRcjZ2bUU4elFM?=
 =?utf-8?B?Wnk1OEs4NGRVM1BMUllYM2ZTSVZRRUU5VVEvdndYblpQMSsxNFh6clJvWko2?=
 =?utf-8?B?Q1pudWh3Y05GL1l3aU9yYUphUHRJVlplOFE5RVludjFhNXJtWGdxV2I2aWdi?=
 =?utf-8?B?L2hSZjVSNzRoZUJhcGw0aUwyYUNyKzdlZ3YrM25MYjBhTXU4d2xxRUpKNVY0?=
 =?utf-8?B?bDBnWjQvRlMvL2VVZ0pLVkhWcEZaSG9Wdk9qakFINVphMFdDNTVSRFZ0ajgz?=
 =?utf-8?B?cGFVZDlNc1BYZ0h0NDFTNnNVa3RQb3pIRi9YRjBTR1E1eUtCcDhRQkxQcTQz?=
 =?utf-8?Q?pa7PsNkEKXxbq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e8e6eb-99c4-477f-2780-08d9116df729
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETIz/Gq6m21EipuIW0N1XjAHKpUbFhEEMZO7WeczISIfAmhlqsFQsduDLJQpwCrF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3757
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Stefan Metzmacher <metze@samba.org> writes:
> If you ever change it just use another struct and another ioctl opcode.
> also the ioctl macros encode the struct size into the id, the the ioctl o=
pcode would
> change anyway.

Ah I didn't realize the sizeof() was used to generate the code, good catch.

If we have a different code per struct size then the code name should
have the key size in it and there's no need to encode the key length in
the struct itself.

So something like:

// rename current one
#define CIFS_DUMP_KEY_128 _IOWR(CIFS_IOCTL_MAGIC, 8, struct smb3_key_debug_=
info_128)
// add 256 one
#define CIFS_DUMP_KEY_256 _IOWR(CIFS_IOCTL_MAGIC, 10, struct smb3_key_debug=
_info_256)

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


