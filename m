Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17506260BEE
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 09:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Z3Pz4qATuLD/13m3/rgOnF3EtgG3NyWJRHmvvRBczjY=; b=K9kIubS9zmwX+eXXgRelTTbBgb
	cPMKGE1a95mLQV13EUIyh6SoU1ZqS5MqXQVjZkSXPzgXdUdXi7vhoMFF0Cmwzw9WubTH9wnT8ZU7N
	LRUzbZEa5pfRbszLrhCoV4bANhDtL7GuF5bPve4z3BO28fYywam90ru6t379hgwRWEqg3+i3TQrq6
	qjxzJkJFEUJkbNfgiwEWAWJEPtuE/8Tz9AggP3ICtGGEqIyxvBAtfQSF9/9QrdRyJDtgyi0VBDtyn
	P5aUik46CzDH+j7vkKFtizBAVkAoKMLVDxif/ffp+YYA+W4iUtYb0kKQBVPXDOuKU6Qxoaxw8PIl/
	5Fm9mERQ==;
Received: from localhost ([::1]:54772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFY1H-004aC6-1L; Tue, 08 Sep 2020 07:26:23 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:30839) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kFY0x-004aBz-87
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 07:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; 
 t=1599549960; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Pz4qATuLD/13m3/rgOnF3EtgG3NyWJRHmvvRBczjY=;
 b=l8Xsdie23LzmCRxbTPKlG1THT9E8uTP9c6Z3A0U0L41LcOpTJUYkdizaDI98eEPmsQVbYo
 TYCyffrCzZyTtzniGi3hvfjzyw8I6nY9uKIv9GsifGVBAUQDkgzloJ4XfBazOBi9HHRAeT
 Jd1b4mjrA3Ul7bzPHZVLzcxorzwptng=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; 
 t=1599549960; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Pz4qATuLD/13m3/rgOnF3EtgG3NyWJRHmvvRBczjY=;
 b=l8Xsdie23LzmCRxbTPKlG1THT9E8uTP9c6Z3A0U0L41LcOpTJUYkdizaDI98eEPmsQVbYo
 TYCyffrCzZyTtzniGi3hvfjzyw8I6nY9uKIv9GsifGVBAUQDkgzloJ4XfBazOBi9HHRAeT
 Jd1b4mjrA3Ul7bzPHZVLzcxorzwptng=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-Y5pg1CIUP9O1gXgqthipfg-1; Tue, 08 Sep 2020 09:09:07 +0200
X-MC-Unique: Y5pg1CIUP9O1gXgqthipfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V986bVuVEBztiPWjBVMiy0olLn0ckph19Hkfwjk19b68rNc22AFcPOXmWE4uXWWLdn85ldBV8yoRArqdjb2XXD5e6kWkv6PgEY19CYZLSbXNkZhQPA2DnrgCYpZIIj2A7fumBIH8HNRQwtwXh6Gj2v4MhKPzAmLgwxZu1uz52tEHOOamdWl4b+R3fNn2E6SxhlqDZi7hc3lzNPrS9eHh9u2VG3C69vP0Mc0EFHU3CTSPzgOAqfmy4E8r+tSGihFHSAQJScC3XSlgGQKUAdOMmh+s+ujGNKzo8naBDrdxLjvSFeHSnHCYYXXA73WNqmexPEVQjsL5Og8DTTGCBP2Pww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Pz4qATuLD/13m3/rgOnF3EtgG3NyWJRHmvvRBczjY=;
 b=bH7zCk5quseOzFNFZQUE+yURVZR+NhCtPN9pyzeO4xl7jWU/yl0CfbeWpAUmbSGtSibBxcwAL1KmEVI6Mas9WttMLkC4d14V7vGoOf/azdz9KkCOb/5W2E4ZPSvbTni5PZBIuHBNQ263hLuhAHxGwoaFbvZt9pT1oGCO6pUV6pFdDxVz3Ley7IJ/82sMYzUJIAoxhaf+gy+LxEvuepsQjO0be4pOIsENk0bjKQCKOBvb0t5fmzOe8CEZsDH8OmjAW2Tnj5J8LaGQriuY7W1V12Y6wIOTBnxEdGex0frMAi7A+U/G2FpH2Tx8IiET2EOJUFy+2jqCE5v4S9OaaRXl3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR0402MB3636.eurprd04.prod.outlook.com (2603:10a6:208:6::13)
 by AM0PR04MB4545.eurprd04.prod.outlook.com (2603:10a6:208:73::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:09:05 +0000
Received: from AM0PR0402MB3636.eurprd04.prod.outlook.com
 ([fe80::75be:f7db:3493:5fbe]) by AM0PR0402MB3636.eurprd04.prod.outlook.com
 ([fe80::75be:f7db:3493:5fbe%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:09:05 +0000
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher
 <metze@samba.org>, Karolin Seeger <kseeger@samba.org>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
Message-ID: <fa168647-5f1d-6386-c3fd-d66cd1408f10@suse.com>
Date: Tue, 8 Sep 2020 08:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.10] (51.37.148.175) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.12 via Frontend Transport; Tue, 8 Sep 2020 07:09:05 +0000
X-Originating-IP: [51.37.148.175]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 449619ce-2561-431b-8e4f-08d853c61299
X-MS-TrafficTypeDiagnostic: AM0PR04MB4545:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RwTR5gK0LwqTPjJIWNwxaJ1PxNUmakEz22VCDJsGsoftFMdprzOnG+k2YL7JyzAQcnoQHBF91BL84a8CVhrpD99vm1QXib77nfWvYaJlLtRvd0lgKyYhp2DEFN7QpJP1HG637QHux6LDFHWvS8LFZnA/bsyUtlYr3S+x4ee+/wpsEFxXuoEE3wcZYepm6DHwcpxxTatyTHz2rYKniFED0VJBVY+Kap3/6oPqsATj52CB6xP6xzMk9cnHLm3rknNbPdbtGwD/YkkVY0GVK5XepgVziSNw/sVwUIdtuljk0nuFClmZMyphzkmAYy9RECW7+9wgsI8gyEfjr/GzcMrfZQ6ZBL+Zf7i+nie9gFf/eGqJEk8rtnI2Nc49LnXLZke0
X-MS-Exchange-AntiSpam-MessageData: ai8cg/susWmCPI76vwm8kOGTllNXEXk1dyEwcjFOd8Ly+GOwRwi8dwzMkPOgse76xNGrIi6dP0UbzLhhrsg7XAshwJCZYazEN0x8W3CbHQU3mVaLo0M80cR3HL4Zf6tfth5SjQqVY/sFYgzeaWdOGN6mSoRrYbIxNP1stRs+3Z95n/HamX26YugLZXqBOf5uVqf0WS7xfMAIH/1oZt2x7HiHjYQaRutoK6dq1sVMihMTODruGBVfwup/3GXf60zHTQURYUOUXFeyS3KwVJgO1MZIuQhwjL2n+QnIV9j6uOsWGJwHrinxRscrZiaBFV6RZKNmCwkYrhgfmLazhYVGVbdWMxInTIqNKUnpzpZHB6vttxQN3YFrpFz13ieB2Vkyc+phFE2Zc/3CB2CdFuZrZrn8LdcPacpkuOBMqrtKaQrzmlw3QOHxLWKXrHsV50C58EocWsOUNV7NC20rbftdHwc7SQDadc5a1+EsWUbdvysGNbWGLryz8H9BgUgjpQWbn3oasTwVj7JcJW/bx+5MPiCHqodYADNfrXrFIPo13/XgpsR8ic6vWBW+iFoEqA16QW+7eJoHtpMKjlHtx5xEvsV3mMmRSiWY/cjdlN09WBmxRMF68O5vzirZb6kBOkgvvQCOLFNxSqD9C8ma/xp+fA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449619ce-2561-431b-8e4f-08d853c61299
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3636.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPWwFmj36XH0TdbGDe57mVHQPD92cTME2YDNSK/CMqWxi0LKHJ4o8n1SjGh/YR3oUxHQkrSV2vRRJqV9/IQTOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4545
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: noel.power@suse.com
Cc: Noel Power <nopower@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

new text looks good to me

/me thought he replied earlier but it appears not :-/, so... a belated
+1 on the deprecation too :-))

Noel

On 07/09/2020 23:17, Andrew Bartlett via samba-technical wrote:
> On Mon, 2020-09-07 at 09:58 +0200, Stefan Metzmacher wrote:
>> Am 06.09.20 um 08:14 schrieb Andrew Bartlett via samba-technical:
>>> On Sun, 2020-09-06 at 01:08 -0400, Nico Kadel-Garcia via samba-
>>> technical wrote:
>>>> MacOS has working python3 according to my developer friends. Any
>>>> operating still based on python3 is so old that it should *not* be
>>>> running a contemporary Samba server, only perhaps cifs-utils for
>>>> mounting from Windows or Samba servers on a more contemporary and
>>>> securable operating system.
>>> Thanks all for your positive feedback.
>>>
>>> Without pre-empting the remainder discussion attached is a proposed
>>> patch for the WHATSNEW for the pending 4.13.
>>>
>>> This gives our users fair warning.  We can then change the build system
>>> at our leisure (giving us a little more time for user feedback).
>>>
>>> To be clear, I'm not proposing changing the actual code in master yet,
>>> please do continue to send in your feedback.  
>>>
>>> (Even after such a warning is given in 4.13 we can still change our
>>> minds, but our users will have been warned). 
>> I guess you mean: we'll remove support for Python 2.6 as well as 2.7?
>> This is not really clear from the WHATSNEW entry.
> I'm sorry it was not clear, yes I mean all Python 2.x support will be
> gone so we can focus on Python 3.6 and above.
>
> Let me know if this new patch is clearer.
>
> Andrew Bartlett


