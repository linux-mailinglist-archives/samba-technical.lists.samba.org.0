Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C3B64C462
	for <lists+samba-technical@lfdr.de>; Wed, 14 Dec 2022 08:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EOoAqryafrGOxeuiesMswBLy12h1J1P4XDBWn9IpuGQ=; b=MRIrRDDa8DWSfMG3hqLcLhW9Yn
	yZz5GeqF+LlIA3JweGSc502ZQff01MYdY7azzPL7YExWJL0RwDxTrvMTkfwq3CN0f6dYxsgdx9ihH
	qTYtlDAeH7d+T9yc30GW9fPfnbC8TP1A7e3XLaggueeTSKwszpku85Gqktj17WhMbR5Ns7IUrAY/G
	YWL+2VTPVi+l4FP9iYy8Ih5UM7MED/CwmUUBnNuE9s5aZdKjxs5YyqS5KaFK+yyxPBMs1o3q+vNwf
	WT0ug2S3IrdDy30afSj9r/o/bmi3Lv+tP8meav067UJ5MZBdoGbqSkBcU/mvyNJUUiT1BoMX9QKWI
	DZlX0KGA==;
Received: from ip6-localhost ([::1]:35700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p5MDN-008z4G-W5; Wed, 14 Dec 2022 07:30:06 +0000
Received: from mail-db8eur05on2068.outbound.protection.outlook.com
 ([40.107.20.68]:32131 helo=EUR05-DB8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1p5MDA-008z47-9X
 for samba-technical@lists.samba.org; Wed, 14 Dec 2022 07:29:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHq/+zP4Gafwqk0BHEhSKCAjaIm2JznOuzLhvEtxd+mF+1i86wdR8IMMJVt3QNeXSSXYchNayR+RQICHw/AyIDELL5y6TOa6ksAHtxYW09+5VKvLaTnft/KX+sKwBi3H48BNzMdSW0sAj/j+yWwQAeRa+TtDnrsYKBxx6iZLfCq/jBVGXQVdEB/26UztWKDlatjox3jXMS3G9ghKQpYUwUUey0N5SQZPCaDklPqGlXovie92jMulfZn8YlaN8NKjFYgdH1Bjn6X5BQVQ2I7MooapzWuGSgomHr5cng57ldwjrIe0g/PzgyZjVMUXfaMBAXQrP223XLXjfKoOdgclTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOoAqryafrGOxeuiesMswBLy12h1J1P4XDBWn9IpuGQ=;
 b=Dj8w8wvFiE4Fgf7APrIFvEHsiiJ+1TSMO2SFzbfwAKuY3W/Po7/6hw1JprmQu/zp0fP0FkyDcM/ifJLPGFal6OfPxVDV/wlJSFZAWY2/GF3BgWuHwISUuCVOxjrZHWRvSovpKA8BNMS1aBMa9ci3xxz+IK399IouhJIJPJOE6t1xb3Y1VV4X5Otu29G3vO9arP0oXofzHGyb1jJACaoP2eUiromxtMmSsZV/zgvlNSs1axo1dL9XVJ+BrUmwKhoSqUXZ817lY5uXJ0eO9b0cncr57b0XCsvRUBpS47u0hYOjQCe7VWpiRvtsvpWpWmNgDly00P6tDzumCiTRCuANbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOoAqryafrGOxeuiesMswBLy12h1J1P4XDBWn9IpuGQ=;
 b=pnhOaR5MaS6GeUjCUN7ZlguXL/Mjy4mK9+aTtJgmzgKuuBnPKMBADaETwFcCjMHpPM71AQmyuWnYLj2e9K2lQKpgg0Lh0BMKRPebBnsDYfzTfjaLIHHUuKNvKeIuAAU+lIdebFIYVV/KQNJ0nJiAlpShRKAWyrLImGOoIKeWxAtb2w7zQLypNwaPXDlucicR9Y9tRoooBpJVQG6TIIRXPq6a8cqMX11sss9QnD7cK+iv0NAhvM1ermCUGE/gSXBxK6UjWSNyQbx3e5tB/deSBQePCH8BPEa4aao50UF0EuilHVPGD4TsYrwOg4WQjP/qCOQriVYse7dTT7z1JvXmag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com (2603:10a6:206:9::24)
 by AM0PR04MB7028.eurprd04.prod.outlook.com (2603:10a6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 07:29:38 +0000
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::6cfd:9a8f:259b:f3bd]) by AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::6cfd:9a8f:259b:f3bd%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 07:29:38 +0000
Message-ID: <669d9ee8-5fec-ca73-dffc-80c522e091f5@suse.com>
Date: Wed, 14 Dec 2022 18:29:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: CFP: Everything Open 2023 (Melbourne, Australia, March 14-16)
To: samba-technical@lists.samba.org
References: <20221214071507.GA7582@seshat.divinus.wirejunkie.com>
Content-Language: en-US
In-Reply-To: <20221214071507.GA7582@seshat.divinus.wirejunkie.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM5PR04MB3073:EE_|AM0PR04MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e97f240-a9ef-4b0f-d910-08dadda4f52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: rOYjoTHlDB45vkZtqeIWDyWJziZITGLzLihlguHCX6ao2RWgRQcTNhEMBzwoX2Rj9t6B8+VYrHryJCsUNAOM6mZ5krZdA/ayVAmCBgTGGNBpMmLxTDKTQ4q1OkIkhJaVawPooFKzC88P9s91aKdcPL3EczvDy4JoM+19sU/vOzFprDC/pldekMC4EpAajT+55/lL+WPvWpcO67vTgZfHxGMyCtV0pvKj51t1eomMzRnhBbh5S3F48/EtFZJ0S05X6cRCmxqjMsXI2gYRbr4btH8PO7jOPybyaAHhsTrgQ0dUPE0mplAKcalrie5z0HkulpZtXruVSMlRguSQz0/8K1GKJBgpDcy8Bbo8wB1BzAmS1tK/Qdfb0wbqeZyvZ+6o9OpdoJUsOg5Zxe668uIKzpAIlYpW0l0/tiJ+aif7tyV9168Bi0/uDWgMjc/fEys9gcbHhx2ZJwC9e/a6n1UuZmlk4qopThybQY02SUEo0NSHbwvTw7jJyw0qzEtDKC6fAX5wIySCD9R+PB4wR9jAHqIY/3ww9xTZYRu4YQUYxKcGswxxzKcpSm4/nGfRebi2gxztWnKo5fzcA0jTdbvflaTtlrqQvZrHTfYpr7/UIV8xszNOQA299MLIBL8gCMwgxKYCeN2L2AhEByfW0RQ7EjaNUA91bmvVKo64wMP3vNDQkggrDOKL/r4mMaYKvZu4NRDNcKG1l8zI2naMU2lvM/aFruRuC6MafGjv2Q/vvpcZFKDTo8YcFTsFRdIe632Mx+oUPpHrZw/mL1hbIM1Ggw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2k1clozeWZKcllhYnUzVmxDNVdwL1VlcmtmVGZtYm5LaUFvQ3dZaHVNRnFQ?=
 =?utf-8?B?Y1ZQYXVpTk8vMCtmcXA5b0VSdWRMbUROcFRtTzBrTmdscit4bzMxM2FqS1Jq?=
 =?utf-8?B?TEJ4d242RzgzYzBkRjJ4bXkxb0VYWXE3a2ptUEVldHJLbkhpdHlyQVhaemph?=
 =?utf-8?B?dis5QnhOYVVYMlFGeVZUOWRvbGRoOUIycTJnSVpCaS9rNmo0bG9nV0pGZXJM?=
 =?utf-8?B?QmVEdjBsMnc5YndySDAzRDkrODkzMVpZMkd1NkEvTFhDVThvVHhLRVdkTUdX?=
 =?utf-8?B?RWVORktjcTN6b09oTHFCWTR5WXJmaGk2amV5YWdGVmlBUzdwZXhtbSs2QlRq?=
 =?utf-8?B?d2dNOHZhbXNoT0VLeTRvR2RtOWE0aFN0OHVtZW1pWlR1a0lhZXp1V05Iekh2?=
 =?utf-8?B?aEptVXRKdXlNSnBDRk0xclNXTVFLUVBYc012dlI3TkZ5UVFIeWh6N3hsWHha?=
 =?utf-8?B?YzVCRWhBVWwxSTRRbHdWODBwRHNrVElUZE5OZGU1T2ZRRlF4c29XWDZVQlJE?=
 =?utf-8?B?dURDbTB2SXhkREpDVDc1N3hNZlErSWVpT0FqcE5KYnUxYTlyOVdWTlBIUjhU?=
 =?utf-8?B?Z0s4V2htRFhFOWdCT3NVdEs2cmlZRThMdHRTY2lNVVhTaVpiL0NMSjVvNTVH?=
 =?utf-8?B?YXkvRytubXZySG8yQktHNllBREFIdk9WK1Z0Y3R4MWgxdW5ZcFBReW9pOTdC?=
 =?utf-8?B?QW9MVGFpdWZzemNMNC82L1pZT3VnalRZcEl2blZ2U0pEVzd1eVI3SG1mRXVU?=
 =?utf-8?B?RWg3YjlhR2JtVmZzdDNNeXNGSGo3UGZXa29FT0J4aFU3dFRIRGVKdDc0NHhS?=
 =?utf-8?B?K05RSDBTRWpKOEZkRGdBbUR6WTY0RHZyRlNjdHcxOVVyVWt6Qlh4UGd4SmlC?=
 =?utf-8?B?b3BIcmZpTjRackZFS1I4Qk5jSVZ0ZDRwUFQ2MjNzRUhmVHgyRmoxTHlDSnV6?=
 =?utf-8?B?NEJRMVlrR3FycVplcVRYcDRvZmRhcVJaYk9tNDJWaW9HY0tNUVpSdVVuSEh1?=
 =?utf-8?B?V25PVnByb1Y2bXBCNDdFV0Q5SE1XTGxSdFRzbzBHVmlWbG9hSy95NGE4RFdK?=
 =?utf-8?B?NGF4TStZR0pSeWI5eWhyRkZxOXcwWFFHMEhvM1pWaHRnZHRwRyt4RnZMSUJy?=
 =?utf-8?B?VnMySUNuSU43eDIrNGMvNG00a0RLUHNDOURaSFV6RFF5VThnSTI2SDBKTkZa?=
 =?utf-8?B?ZDZqVDQ1YWc1YWcxQlhoRzAwbzdVYm1Deld5bCtEczh2bzd6aWhPODduUDZ1?=
 =?utf-8?B?dGNBakYwdGI5YW04R2pQdmlBM2tBVlV0VTAyaVNtUTVhQTVvTlNyeUNYTUN4?=
 =?utf-8?B?K2tiNEFtciswdERlT1Z1dzVqVE5Eelc1dmtaSUtHVGJsQlRmeUx0Qk9zR0VZ?=
 =?utf-8?B?b2pHempvSTNwQTY1aGpmUWpOS0hZR2cwdk5wVUdBZTFZTXNoQ3d5VFlwZ3hM?=
 =?utf-8?B?SVcwZ000RHdDRjFZQ3JXUWxvb011TzNLUWVicDFsZlhsVFhEUkZ4T1pnNVRF?=
 =?utf-8?B?U0hUKzg2dEdIb2hVeU1RVnVYOG13MlBKSExtSkdNVTBMWThYdUJRbDUvb3pi?=
 =?utf-8?B?VkpjQmpCYVVPbmFxOTN1dnVLTGFPNWRyekczQjg2ZkdtcFZlZncxUjVYdFcz?=
 =?utf-8?B?aXVscE15VGQ1b3VuOWlLdTBZbWh4KzQyVisxNW93TklVOVU5L0d0WjU1dTA3?=
 =?utf-8?B?dGEzczY3Rk94NWVKRHY4bk81T2NBWEtzcVF4OWs5d1FkMkdUVEpIQ2xsKzlk?=
 =?utf-8?B?VnkzRHoxVzh3TWdnTU5BU2dnRUt4SVdvRytveCttVFlqWWozNW1QdmJESHN5?=
 =?utf-8?B?ZGtOR3JQN01YTnA4ODhSdDBzdlBTcGxPZU9tZVI0Zzh4NmY0TFd2dFEyWno3?=
 =?utf-8?B?QnB3TjcvdEdubEVOTjhpTkNXVCtSZHRoVG4zVjIyVFJuQUtRajI2dEUrcG13?=
 =?utf-8?B?MEhsWExjZTJZSG5OLzJWSCsvbitxTjJCQ3MyMmoxdWJjNDFmNGFma0FkUFg5?=
 =?utf-8?B?eG9KVnJaUnhlVCttbHlzdmpnUTgvYTgweEd3eWFxd1lIdU9KeXIrWms5eUZZ?=
 =?utf-8?B?UGpZWVpTUTZuQ3V3cHNnTUdZazFLZ3ZNQkdNNXV0SEQvd0FjU2VkZkdDWUov?=
 =?utf-8?Q?8pTo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e97f240-a9ef-4b0f-d910-08dadda4f52a
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3073.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iGfPdZqvFbDOL6iA6LkbYgmqVRF68XTzWdyJ/SEBYa8tNuZH00tH5Hp2jBrJ7tfvEUV78F/Nz39upcQryTN0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7028
X-Warn: EHLO/HELO not verified: Remote host 40.107.20.68
 (mail-db8eur05on2068.outbound.protection.outlook.com) incorrectly presented
 itself as EUR05-DB8-obe.outbound.protection.outlook.com
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
From: Tim Serong via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Serong <tserong@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Everything Open is a new open tech conference auspiced by Linux
Australia.  For background see:

  https://everythingopen.au/news/introducing-everything-open/

For the CFP and other details, read on...

-------- Forwarded Message --------
Subject: [Announce] Everything Open, All At Once!
Date: Tue, 13 Dec 2022 20:00:15 +1000
From: Everything Open <contact@everythingopen.au>
To: eo-announce@lists.linux.org.au, announce@lists.linux.org.au

The Everything Open 2023 organising team is excited to announce:

* Call for Sessions
* Call for Volunteers
* Financial Assistance applications

ARE NOW OPEN!!!

----

Wominjeka Everyone,

Everything Open will run over three days - March 14-16, 2023 - in Naarm
(Melbourne) at the Melbourne Convention and Exhibition Centre.
We are excited to be opening our Call for Sessions to get another wide
range of talks and tutorials in our schedule.
We also need a team of volunteers to help us achieve success with this
conference.


## Call for Sessions

We invite you to submit a session proposal on a topic you are familiar
with via our proposals portal at
https://2023.everythingopen.au/programme/proposals/.
The Call for Sessions will remain open until 11:59 pm on Sunday 15
January 2023 anywhere on earth (AoE).

There will be multiple streams catering for a wide range of interest
areas across the many facets of open technology, including Linux, open
source software, open hardware, standards, formats and documentation,
and our communities. In keeping with the conference's aim to be
inclusive to all community members, presentations can be aimed at any
level, ranging from technical deep-dives through to beginner and
intermediate level presentations for those who are newer to the subject.
Where possible, talks on a related subject will be arranged sequentially
in the schedule.

There will be two types of sessions at Everything Open: talks and
tutorials. Talks will nominally be 45 minutes long on a single topic
presented in lecture format. We will also have a few short talk slots
(25 minutes) available, which are perfect for people new to presenting
at a conference. Tutorials are interactive and hands-on in nature,
presented in classroom format. Each accepted session will receive one
Professional level ticket to attend the conference.

The Session Selection Committee is looking forward to reading your
submissions. We would also like to thank them for coming together and
volunteering their time to help put this conference together.


## Call for Volunteers

We're calling on people to come forward and lend a hand again. If you've
done it all before and just want to get on with signing up, all the
details can be found at the volunteers page -
https://2023.everythingopen.au/attend/volunteer/.

If you're new to it all and want to help out, keep reading!

We're all volunteers ourselves and we need more – we can't run the
conference by ourselves, particularly during the week of the conference
itself. We need help with:

* Checking attendees in when they arrive
* Operating AV equipment such as audio gear and cameras
* Directing people around our venue
* Ensuring talks and tutorials run to schedule
* Setting up and packing up the conference

Anyone who has volunteered for a Linux Australia event before will tell
you it's a very busy time, but also very worthwhile. It's satisfying to
know that you've helped everyone at the conference to get the most out
of it. It's very rewarding knowing that you've made a positive
difference to someone's day.

You don't just get to meet the delegates and speakers, you also get to
know many of them while helping them out. You are presented with a
unique opportunity to get the behind the scenes and close to the action.
You'll get to forge new relationships with amazing, interesting and
wonderful people (just like you), whom you might not have otherwise had
the good fortune to meet in any other way.

In return for your help we'll provide you with:
* Food - morning tea, lunch and afternoon tea
* A clean T shirt everyday
* If you want one, a letter of reference at the end of the conference

Depending on the number of volunteers we get and workload (many hands
make light work), we'll do our best to allocate you to roles so that you
can attend talks that interest you.

For more information, please check out our volunteers page at
https://2023.everythingopen.au/attend/volunteer/, where we have full
details of what we need assistance with.
We review and approve applications regularly.


## Financial Assistance

We have budget set aside for providing financial assistance to
Everything Open attendees who might otherwise find it difficult to
attend. This program is a key part of our outreach and inclusion efforts
for Everything Open.

Anyone can apply for financial assistance for Everything Open 2023. The
assistance can cover things such as a ticket to the conference, travel,
accommodation, or other costs that you would incur to attend. We will be
processing applications on a regular basis until funds are exhausted, so
we encourage you to apply early for a greater chance of being accepted.

Full details about the program and the application form can be found in
our Financial Assistance guide at
https://2023.everythingopen.au/attend/assistance/.

If you have any other questions you can contact us via email at
contact@everythingopen.au.


_______________________________________________
announce mailing list
announce@lists.linux.org.au
http://lists.linux.org.au/mailman/listinfo/announce

----- End forwarded message -----

