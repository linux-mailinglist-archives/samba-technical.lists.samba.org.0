Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA535F313
	for <lists+samba-technical@lfdr.de>; Wed, 14 Apr 2021 14:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=GW3H2zH9OK6rMOsc/IpqGm1OHC3FnsL8rDNYh7Jjs+A=; b=Hccx0t/DJgncd5gpmhDV4l/T4U
	FSIgBvcu4eCsS3FQ4qTFyJpLck3b0J4MJlvWoE44/WRP3W5bBu/wuIWtwKXW1bygx6bx67lVFRlD8
	kNNr41VMohLk7p+8rxLC/zZcdopwy1vhl3BiKmnKQngW66ZlzExRJfhgm6WwYEtjsc+ygevP9Hhqa
	6RMjdbdwo5DxzoYmsRXcEPPGFCvhOXwgrm5cFOSrvLh/yCz62Hx4RfqhpLeyStnvlLeAXYn0eHNqB
	XY+34mULB3Ed1t5Cos67dDNamoZKZyQ49lukE+XGcWdnsHx/y++A2viGAT8t1rMmKRVaWYjeggmX7
	Sm0TVGpA==;
Received: from ip6-localhost ([::1]:35430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWeC7-00BI77-TV; Wed, 14 Apr 2021 12:00:32 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:39585) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lWeBv-00BI5A-9U
 for samba-technical@lists.samba.org; Wed, 14 Apr 2021 12:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1618401616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GW3H2zH9OK6rMOsc/IpqGm1OHC3FnsL8rDNYh7Jjs+A=;
 b=fSnUbMj2t8tmIyUSEAo6GjiGUtnok2ke7zlP5SUyFRMGcXi9+1pgR0+gXFXMq/R54SY79v
 t6cUsjgyhZfF8+c0fkzHHonqmc/CvNKboYr6Vonhb1pJRsUPVsurl55bomJRWjARtvWSTn
 lopUpwrytGI5wBkxmR2GIjaas9H1lYE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1618401616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GW3H2zH9OK6rMOsc/IpqGm1OHC3FnsL8rDNYh7Jjs+A=;
 b=fSnUbMj2t8tmIyUSEAo6GjiGUtnok2ke7zlP5SUyFRMGcXi9+1pgR0+gXFXMq/R54SY79v
 t6cUsjgyhZfF8+c0fkzHHonqmc/CvNKboYr6Vonhb1pJRsUPVsurl55bomJRWjARtvWSTn
 lopUpwrytGI5wBkxmR2GIjaas9H1lYE=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-FaPxWxg0PAO6vKNC5YysKg-1; Wed, 14 Apr 2021 14:00:14 +0200
X-MC-Unique: FaPxWxg0PAO6vKNC5YysKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TasslUl+qQvNgkV96ii+5I+WVKYFkchXWKeOsSGAxAe1yXTdq+wImkZ0iV9U0XRrrAn5UgL4Eyb4IwoAwqdS7EFGSuPQGZK8mvtLNFvZthFn+1uO2/zCuV/wz4C7dBy7fUYorOdXnIdbQHb0HJom7DE9BXjACJIfhLeIssev/xaXR75oY/R5weWHFzFNeAyYpqkEK3+kGhqE+CDa46LrUNDXtEaoE1wC5bBsEAmPnaHHlhgWWnq2l0PjHyDB79Bz2VdEJepslNwQecZlBGg9Gfv1kIutenOJHirpdG4p1vApQ/RFstzEg0hDLHIhPVJ17MUsLthzd8r+JEp/X2rD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GW3H2zH9OK6rMOsc/IpqGm1OHC3FnsL8rDNYh7Jjs+A=;
 b=f7KN3N9lAB9acTrfgV85rU7bv6QprnmQhE2pz1Ctr5bhtB2ifanyTGlk8MKHtcPSJ3hZoOXfWu0NmTDxgh5pq9KK/HHgPjWSkVlcHqMg3J3+lSZys2K9fzU5LLqTpPVGRViYQ4lKaUAJaeZV/1uPTP5qjOGQ1WnW/tcHFMlqUOT846msy1H/RIsQoON3ILoiqx62fC4hLMoY0DUtoSo/ybtQ2ZpDUVrh6msmyiQgcGQIMqZiIeCOrWQh+AmOXcLCMaKGi0C7qwx0HMG+fYQv1VnvQryuhkn6wVCq0cnT3w2njIwixCEhYeDvZhxoYLHENVpILOyL8LFRntVPOgwfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VE1PR04MB6654.eurprd04.prod.outlook.com (2603:10a6:803:129::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 12:00:12 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 12:00:12 +0000
To: Muhammad Usama Anjum <musamaanjum@gmail.com>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, "open
 list:COMMON INTERNET FILE SYSTEM CLIENT (CIFS)"
 <linux-cifs@vger.kernel.org>, "moderated list:COMMON INTERNET FILE SYSTEM
 CLIENT (CIFS)" <samba-technical@lists.samba.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cifs: remove unnecessary copies of tcon->crfid.fid
In-Reply-To: <20210413232558.GA1136036@LEGION>
References: <20210413232558.GA1136036@LEGION>
Date: Wed, 14 Apr 2021 14:00:09 +0200
Message-ID: <87tuo913g6.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:703:334:3d56:188d:3047:1bd5]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:703:334:3d56:188d:3047:1bd5) by
 ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18 via Frontend Transport; Wed, 14 Apr 2021 12:00:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a76ac50-d147-4fd0-462d-08d8ff3cdbcd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6654:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Eh8BsofqCBJppCbNCgQUQSWCZN5H8TC6vYat7RfE82J/bulKDTLfxvgf1cNssN/W5UmWZ5x3hX5tgGEEcrNGYaFXT7d8dO+RwJuy8BHZtGRQo6GBzc9Xj5jz5+ugkPEydVCy9PbCsAcgeTAZDRaYD1Y7mIIbVfPTUbPnpr/IUpAASGx5RL9tFHZ2Y/jsU17NIKqdC38A0kGCAG0NRCKChyVpn675YGQQe4YL8RPeVuuRz+xn/MI1UPLyhsa2HjSGSK7+8mT1P+L9Yu75RfrQC2Rw1BI7uttoqJLm52+nHrE9O8nEfUEgEuK8pUL6eWbjnfeV76eoYEqMG/a4W8z5Uf7mUc9ZZXHUlCTTNhre8LKBCJZ+oKUSpJIbBfNCHCXscq5BSMpJfBLZ5eLXojjGQvf3HGG++5s478cD/ScsWvxFuLZoSzbZIFdUILC2DjvQwIVv6xSso5sPiWcP9YF/0CdralrTyI5dlqYiXyfRJuxN2yOQQ3q4jfBWGmykneKySWb9nPqSRHlzfxibwRmRV3FsaDb1Yrt1KIdy9+pZ27h3VozR4jbDrLNsEDmGHAViIogSGJI7eMAT+/IquxObLw==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmZJdmNOdDh3L0VnczBmSVNGbzZJZXNlUVIxVWNaeDJOb2ZKOEZndndoOTJ5?=
 =?utf-8?B?Wndlek90Zi91R09PRk5GUG5CZjZ4bjFzVEVHRDZJK2ZoSTlMYitaRW1mOWNu?=
 =?utf-8?B?N3Vkb1ZudFdSS1FIMGlVSzVFSXBER215U29MZDRUbkk2Umkyd3JoZHZIVGhz?=
 =?utf-8?B?eWt1a20rWWNSbTNweGNQVnlnQktRbWJ6cmFlOVFnRkd5QmJQR3BZUnp2eGVx?=
 =?utf-8?B?M2xoaEhURDJZTzBvMlY4TG1jdllQWm12NHBlQmFORXZaeEVuL09ya2ZWSXVk?=
 =?utf-8?B?VFhuNXJLVmtaS05rRXVwL1NpSFZ0TFdiVHg0K0JmbnF4T0kyOGFyMmtkUmZC?=
 =?utf-8?B?S2MvVUZYOTdnWFRmd1NXcC9TcFpQU2d2c21hQWlXcVVETHgvdG1VMUgxVmlq?=
 =?utf-8?B?ZkRvS2ZocFJRS21BSGRCQzQwOTNIUW1CR2h1Rm5DNm5xVHpWN0lkRm9aMDR0?=
 =?utf-8?B?L3Z0T1lwTzFZOHRYVWVsOFZycHpsSXpMMVA4RG5ocWZqMENOTGR6czRUdHEv?=
 =?utf-8?B?aVV6WmthdTRWTDZVa1doQkZNUUxQWnFoVUNadFZWTmFiR3JpVlIraWtXLy9E?=
 =?utf-8?B?dTZ6K0xMQmFTS083MFdkMDRSZ3YzUng4Q2tQcmVpRm84OW9XSHFuQnlkajVE?=
 =?utf-8?B?UlI3N0ZraGI1VExtR1JxOWxNUmpacjU5alNvNXlXem9IOS9odU1kS2tOZjFj?=
 =?utf-8?B?T1duaXNyZUUyNUNRc1MyandUV3FqRVdOMUxpTStLdVg5QUNJRDhPNEZma0pL?=
 =?utf-8?B?U1dZY2FGQS9wc0NtZFBGcjQzUmJKNHdxa0xyVWlSTjVQQk5zeG1GaTJ0NTFN?=
 =?utf-8?B?enZqRTk2Tld0V0kwUmVqZGMxN0o5SlN4SDRkMzk4ZnNIc1dDTmpqUTl6Kytt?=
 =?utf-8?B?OXJvSXkzNnFxbW5zeUdPMmI3b2ROaTBrMkQxTEoxR3NGVFpSbm5kNFNwdWZD?=
 =?utf-8?B?aVdQWjhSMGhveVkzZmhzUVhnem5jcHd3cHRnRlBLUFB2c0FQWjNLSlhUVWJ4?=
 =?utf-8?B?NjFtQStWd0RmdWtLaUN1dSsxR2N6QXF6WldmSDRNbktoWE4zVGdZL0JDNE9G?=
 =?utf-8?B?dkNpWVRPU2xIWWRpTjN5d3k1OW0zYzFTclVMOENnZXpnZkJNc2hMSHc3dUpL?=
 =?utf-8?B?YzFTV1dadnZXQ0NZMzRtYTdxeEorQVZZcytscVFTZ0hEV3FRelJUS29adTIr?=
 =?utf-8?B?OE9sanMzVmoraGVQUEhnM3VaT0hPUThCUjFHb25wVnR1R0FRYVBVM2FXQjln?=
 =?utf-8?B?dEhQdE1ZaWxlM2lTRmYrUmxRZGpKV0ZoVFd3b1FzeFNYQ0dMaEpBNjN6T2VO?=
 =?utf-8?B?aVplWEl4TW94S0dwODE0dWdFUVJyekFqWFlnajk2aXJmRkFqMVZONEhVV2N0?=
 =?utf-8?B?L3NDSFRmRjJyNjlSdjk1cDc3OXFtV1pGZ0JwMTFRdUV1SVcvSFhtQ0IvaXRr?=
 =?utf-8?B?SzhHcjh4U25BR0g5bU1kR3NKcDllemMwSnIyNHpqVVdnSFVpMGhnSk4vaDdO?=
 =?utf-8?B?MStWcWlXdk9ZVXVvTUNHVElUNldDL0kvOVRUMXFZMWt0L2lGVmxiRkJWbkUw?=
 =?utf-8?B?blk0OHFJckpOWUUzTTAyTzZEcmg3UGdnQTBtZGFSQ3RJMjNlNWh6U0JmZUQ5?=
 =?utf-8?B?clpJQk1mZ3pYUmtrOXhWbWJOQTJGdVloa3kvQmxUV25kMEZmTHp0Z0pGQ3Vx?=
 =?utf-8?B?ZWFpZkxxSmFqRU93UHN3Ry95ak5ReGNmdlBtWmczR2NUa09RRjEvT1Q3TkF5?=
 =?utf-8?B?c1orQk1VRUZhWHF1UzFCNFFWUmZXLzdlRStUb08xSzdtV0tSVGtMQmlsM2sw?=
 =?utf-8?B?aCtSUFFPb002OUdzVmlqU3JWNDhFRGhRVlRDaVFlY0ZvOUpWb1NBaVdkWGlL?=
 =?utf-8?Q?oNWx+M7Pxo5Cp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a76ac50-d147-4fd0-462d-08d8ff3cdbcd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o6KUYsZvDlcKH5XOjJBFcRF+H0Y//n5YhZ3jC0zV2lCpQHhcQ4UzBypH6zU3owH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6654
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
Cc: colin.king@canonical.com, kernel-janitors@vger.kernel.org,
 musamaanjum@gmail.com, dan.carpenter@oracle.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Muhammad Usama Anjum <musamaanjum@gmail.com> writes:
> pfid is being set to tcon->crfid.fid and they are copied in each other
> multiple times. Remove the memcopy between same pointers.
>
> Addresses-Coverity: ("Overlapped copy")
> Fixes: 9e81e8ff74b9 ("cifs: return cached_fid from open_shroot")
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
> I'm not sure why refcount was being incremented here. This file has been
> evoloved so much. Any ideas?

The fact that pfid is the same as the cache is very weird... Probably
due to recent change.

This function returns a cached dir entry for the root of the share which
can be accessed/shared by multiple task.

The basic logic is:

    open_cached_dir(result) {
   =20
        if (cache.is_valid) {
            memcpy(result, cache->fid)
            return
        }
   =20
        // not cached, send open() to server
        dir tmp;
        smb2_open(&tmp...)
        memcpy(cache->fid, tmp)
        cache.is_valid =3D true
        memcpy(result, cache->fid)
        return
    }

My understanding of this is that all file/dir entry have a refcount so
to prevent callers from releasing the cached entry when they put it we
need to bump it before returning.

    open_cached_dir(result) {
   =20
        if (cache.is_valid) {
            kref_get(cache)
            memcpy(result, cache->fid)
            return
        }
   =20
        // not cached, send open() to server
        dir tmp;
        smb2_open(&tmp...)
        memcpy(cache->fid, tmp)
        cache.is_valid =3D true

        kref_init(cache)
        kref_get(cache)

        memcpy(result, cache->fid)
        return
    }

Now this function can be called from multiple thread, and there are
couple of critical sections.


    process 1                process 2
    -------------------     -----------------
    if (cache.is_valid)    =20
    =3D> false continue        =20
    smb2_open(...)           =20
   =20
                            if (cache.is_valid)    =20
                            =3D> false continue        =20
                            smb2_open(...)           =20
   =20
    cache.is_valid =3D true

In that exemple, we ended up opening twice and overwriting the cache.
So we need to add locks to avoid this race condition.

    open_cached_dir(result) {
      	mutex_lock(cache)
                 =20
        if (cache.is_valid) {
            kref_get(cache)
            memcpy(result, cache->fid)
            mutex_unlock(cache)
            return cache
        }
   =20
        // not cached, send open() to server
        dir tmp;
        smb2_open(&tmp...)
        memcpy(cache->fid, tmp)
        cache.is_valid =3D true

        kref_init(cache)
        kref_get(cache)

        mutex_unlock(cache)

        memcpy(result, cache->fid)
        return
    }

But now we get reports of deadlocks. Turns out smb2_open() in some code
path (if it ends up triggering reconnect) will take the lock
again. Since linux mutex are not reentrant this will block forever
(deadlock). So we need to release for the smb2_open() call.

    open_cached_dir(result) {
      	mutex_lock(cache);
                 =20
        if (cache.is_valid) {
            kref_get(cache)
            memcpy(result, cache->fid)
            return cache
        }

        // release lock for open
        mutex_unlock(cache)
        // not cached, send open() to server
        dir tmp;
        smb2_open(&tmp...)
        // take it back
        mutex_lock(cache)

        // now we need to check is_valid again since it could have been
        // changed in that small unlocked time frame by a concurrent proces=
s
        if (cache.is_valid) {
            // a concurrent call to this func was done already
            // return the existing one to caller
            memcpy(result, cache->fid)
            kref_get(cache)
            mutex_unlock(cache)
            // close the tmp duplicate one we opened
            smb2_close(tmp)
            return
        }

        memcpy(result, cache->fid)
        kref_init(cache)
        kref_get(cache)

        mutex_unlock(cache)

        return
    }

That ^^^ is the pseudo-code of what the function *should* be doing. We
need to go over it and see what it is doing different now. I think it's
likely when we made the code to be used for caching any dir
something diverged wrong.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


