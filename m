Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3A294CD4
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 14:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=57qDJ8Zz+a37+1rxF/vLJm66xJ5CcCydaqffWYJfoaA=; b=giUCfPn1fX2vPiI3xhURFD3eif
	bANxcPhFS+X23EyBu9EixUmzqOGz3xxTOhE6dvE+cpZtdR9hH+1gnZivtEjepoqVBeEMEYoOFFpLn
	F7OdsLjuvvZ6GNLx5O8YecZn+riKCzwe4zOae8TaPt2530h88mz+Y1CUBVQUFRJdK3+zN6+EJSdJP
	YC3oH3PS9atwGPz5cPiknhjGMww8ygCJmo1dHnaHefv5kFJe9kUIJ2bYEwjLhAvp+4Jxc/Dr8cZnd
	tlm0f6wfq/DhSj5BkbfU9fkW6LR6UYzVh2Jxmxf1ClswlqmAO3QnRO3EiJ6COyvQLYjjTRv4lF1eR
	S7FNFwrg==;
Received: from ip6-localhost ([::1]:50024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVDNr-00D80N-6Z; Wed, 21 Oct 2020 12:38:27 +0000
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:51828) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kVDNl-00D80G-Al
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 12:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603283898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=57qDJ8Zz+a37+1rxF/vLJm66xJ5CcCydaqffWYJfoaA=;
 b=mwskkwgFVAhhXT+eOLqrFSzK0lehuo6cUbKNFp/JJmVJctyBr5tZ4ZYNHWzvKIqLLHhTV8
 /Ml48kHoCXTvVTgR7cP+VDQJaYBcqKF8H8n+ZOnh2Cyg+JgLqG7qK6H5Y+8b0ZPPHHI2Dr
 DMy0b4KScHn8ZnTrHtbbjr3Dlb+GGfY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603283898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=57qDJ8Zz+a37+1rxF/vLJm66xJ5CcCydaqffWYJfoaA=;
 b=mwskkwgFVAhhXT+eOLqrFSzK0lehuo6cUbKNFp/JJmVJctyBr5tZ4ZYNHWzvKIqLLHhTV8
 /Ml48kHoCXTvVTgR7cP+VDQJaYBcqKF8H8n+ZOnh2Cyg+JgLqG7qK6H5Y+8b0ZPPHHI2Dr
 DMy0b4KScHn8ZnTrHtbbjr3Dlb+GGfY=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-r6-hIm_GMS-pUd5q5BqPKQ-1; Wed, 21 Oct 2020 14:22:42 +0200
X-MC-Unique: r6-hIm_GMS-pUd5q5BqPKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gmot4vQhij/I3onPnsGEzotBzU5Isnz2EKHlI65zvzIIaCJD+TfS6rWONg0Mts1jxCmMC2CgPbxH+zpJgKiQejBGEOqDrkbfdaNNx5rubQPQV8jPWgtwaE1zLGg7oyUhzv8cVX6Fl7sQdXEFoCJe1leLDJLFxKLO36qV/5GobXs+kN6wm2WTuromwidt/uk8Pl28vE7G0loyjtfuOhUyQa/E9QgdtVqGW6VIGCfHmKwg0+klegkZ+jNkHg+0wtc78sytnXv3OCNQoCbedlLYikSdGSQiz8exnBzQqWOx0Dc24r7EDQfGFfammz0sd7Zh+h4kgix58QqgMJdtPMKB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57qDJ8Zz+a37+1rxF/vLJm66xJ5CcCydaqffWYJfoaA=;
 b=XI0DcOxq29SrbgncoLnGFiWIfWjLDLRZhlPr0uwMKYgY0NAUAKlgSAXImrQiQFExvJRmM4aE7u/IBrUxOFg+/oetJuqDCcrY8bn36knUDZYDR+qGrCD4b08Ovre4yfXXLw+S1v3JkJgkiR/yCydNmR9z52wlCsQsoWsRz6JgM7Jfsv9sasp/KV+XyWhk9W1WyDYnXDX/jMgYhQ477/4cj1KjUfszu/e4nM3WVP7vXtajESWxzUl4hmjkZQhhrJDSfEVCR7gFcWV+qMN++MmatowQ0MDqhOQNHDTSi+mmugkrpj8YnZJ4ZffUyGcJawVO9ixzc4XOVeiT8q/iWxkPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com (2603:10a6:206:9::24)
 by AS8PR04MB7911.eurprd04.prod.outlook.com (2603:10a6:20b:28b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Wed, 21 Oct
 2020 12:22:42 +0000
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::e194:8de9:5feb:17b4]) by AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::e194:8de9:5feb:17b4%2]) with mapi id 15.20.3477.025; Wed, 21 Oct 2020
 12:22:42 +0000
Subject: Fwd: [lca-announce] linux.conf.au 2021 - Call for Sessions and
 Miniconfs Open
To: samba-technical@lists.samba.org
References: <mailman.580.1602758774.3060.lca-announce@lists.linux.org.au>
Message-ID: <54f71c9b-0c39-7fb8-9967-116ddcee4820@suse.com>
Date: Wed, 21 Oct 2020 23:22:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
In-Reply-To: <mailman.580.1602758774.3060.lca-announce@lists.linux.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [14.2.179.137]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from elen.suse (14.2.179.137) by
 MEAPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:201:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 12:22:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46d77322-2299-4291-3ea0-08d875bc0207
X-MS-TrafficTypeDiagnostic: AS8PR04MB7911:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: J62Tj1cRbZVwP0I1NLQ0rQD/SE0oYwnXOkGCuvtogIo46xkXUTQwkwE0b9EIv5Lg/4el8bHZLb2mqs3yMkFvAlvJplx1eLIHuVIWQJOH0bhbAnrlcCT8qiuFoyu8JCzBcRSjcDyrGw28WqBAdB/kYovkCFYXHEzhGNKU/Jx+HhIr9aQze208AAT35XZ88cF7zjgsZq6QgRVImsXiNHk+/XZXM4F7qIHgPo+oZxIMZCUPR2dfLntv3Ko1xs6qo4/WDvEp4udrF3lyeDYT4qOXOUM+dkEVSyn4fZKOJgnxQd7AScbGp+s4abNG+C17Zdv6eNI8K5fDCx56olH5JVBAbaMgETcrJ0DUCwNNqNxhJW6nQ41paKK4WfXbsULiQErum76WnNG61I5FeMFVS1hZpWyeS6cjiaePoaqrSSRdAQV5bOqC0LJaF5q9K1tPQWDVtGnEfpMct/39PqIcKoWqeg==
X-MS-Exchange-AntiSpam-MessageData: r/IcALb7Ygip8d/z9OMrN9JrtjEUwPoRobTaopQX5Kqw+0+JdyO2XeQSJNLrB1RqodW6mQof6B8IQRIvE4DGbHdnLdT46ZJep84UnRa651+s1ZfRRWRViyP2+OPTBbnTxo0YhgfO8OJg1aCi08EjKUlNMFgOkp/OMkOKzAsYqhtDKb0gnWps9hGT1NkGiryMeLq6ZUUeEwxPJ7pRltxzQjJ0G4YSArwjsH5yv+NZkhbK8XFXe2buENXvJjAl7AvHFcdzZ1JvLQ3QM9sTbkXLyMJ4PVmHsTvLi7kIJIJuNHunFUP+8ZoXFooU8jncDf0jOa9mDfKioMtIWoc0abPDMflSBJ3ux/VxmMGBTrTdJx47RIEKlRzoY+1AiJFJKQdV+++uyCYxhKFb6YthDs7N6AqmMTWlUx9fG/KUVevJCNn/1ww9SMKaMH6bA29GLDavjFRCjM58hv3Fr7zvKJgJqST/sT0O10nbEuM3x38FNr+4TN+HIo9DrMvX5DA2iLr+L1D5L9ODUUnYZf2+0Zv1Dz2IuHnCGCOe/aBS+OhbAFIhaEjj3FuSetawcwksciAn0bPQ5HanONMP/Utn/Mo8ftY2r2dfxj8Bpw2V+DdNF2XteymGxdHGdqYWvg2J+zYOK1cnFicwve4RY7v5TucmLw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d77322-2299-4291-3ea0-08d875bc0207
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3073.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFEUVEaHfMu5ne41il8eeCx/HetTxRcuM582BLAfpADKFzWNzrFSgpc2oOOZ77fOcCBa1GimAnLyCpoz98JL9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7911
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

The best F/OSS conference in the southern hemisphere is back again,
virtualized, January 23-25.  The CFP is open until November 6.  Submit
early, submit often! ;-)


-------- Forwarded Message --------
Subject: [lca-announce] linux.conf.au 2021 - Call for Sessions and
Miniconfs Open
Date: Thu, 15 Oct 2020 20:43:24 +1000
From: linux.conf.au Announcements <lca-announce@lists.linux.org.au>
Reply-To: lca-announce@lists.linux.org.au
To: lca-announce@lists.linux.org.au

We're excited! The linux.conf.au 2021 Call for Sessions and Call for
Miniconfs are now open. They will stay open until 6th November 2020
Anywhere on Earth
(AoE) (https://en.wikipedia.org/wiki/Anywhere_on_Earth). This is only 3
weeks away - so don't delay, get your talks in early!

Our theme is "So what's next?".

We all know we're living through unprecedented change and uncertain
times. How can open source play a role in creating, helping and adapting
to this ongoing change? What new developments in software and coding can
we look forward to in 2021 and beyond?

If you have ideas or developments you'd like to share with the open
source community at linux.conf.au, we'd love to hear from you.


Call for Sessions

The main conference runs on Sunday 24 and Monday 25 January, with
multiple streams catering for a wide range of interest areas.

We invite you to submit a session
(https://linux.conf.au/programme/sessions/) proposal for a talk. Talks
are generally 35-45 minute presentations on a single topic presented in
lecture format.


Call for Miniconfs

Miniconfs are dedicated day-long streams focusing on single topics,
creating a more immersive experience for delegates than a session. We
encourage you to get creative with how you could deliver your Miniconf
virtually!

Running a Miniconf (https://linux.conf.au/programme/miniconfs/) is a
great way to gain experience, provide exposure for your project or
topic, and raise your professional profile. They're a crowd favourite
and an awesome way to kick off the conference.

Miniconfs will run on Saturday 23 January, before the main conference
commences on Sunday.


No need to book flights or hotels

Don't forget: the conference will be a fully online, virtual experience.
This means our speakers will be beaming in from their own homes or
workplaces. The organising team will be able to help speakers with their
tech set-up. Each accepted presenter will have a tech check prior to the
event to smooth out any difficulties and there will be an option to
pre-record presentations.


Have we piqued your interest?

You can find out how to submit your session or miniconf proposals at
https://linux.conf.au/programme/proposals/.

If you have any other questions you can contact us via email at
contact@lca2021.linux.org.au.


Timeline

16th October: Call for sessions opens
6th November: Call for sessions closes
January 23 2021: Miniconfs!
January 24-25 2021: Main conference presentations

Tickets will go on sale in the coming weeks. We'll keep you posted.


We're looking forward to reading your submissions.

linux.conf.au 2021 Organising Team



About linux.conf.au 2021

Running since 1999, linux.conf.au is the largest linux and open source
conference in the Asia-Pacific region. The conference provides deeply
technical presentations from industry leaders and experts on a wide
array of subjects relating to open source projects, data and open
government and community engagement.

---
Read this online at
https://lca2021.linux.org.au/news/call-for-sessions-miniconfs-open/
_______________________________________________
lca-announce mailing list
lca-announce@lists.linux.org.au
http://lists.linux.org.au/mailman/listinfo/lca-announce


