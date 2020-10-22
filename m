Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406D295D7C
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 13:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=tqHLJJIzST18v9/q7u+MkgDwY/Vo6eeYgnN/nwG0Fuk=; b=V37T/td5qzxPmbJ6Z39pOx4jpv
	mZo8yNDeG220S2n0PEyDAcFMG3wdk0Zc7QoZ7UrVkEZANELwrxHtv4xf5L9+upqr38wWRUY3zdSTg
	N1ZT3a0Fy8S7MkE/GTmv7OCsbwM4pAneyqzDJzFZUcUi4rWmwPARVhejCfPRzPuUWlpcTHhFEm2ci
	IgkUix4eGJE82C8zo8vlAMTwp826A4Ut9khd56S/OEHjlgStAcGgwsKWHJ85uyayAVmmOUI0/I8jq
	KmHLIMYFhxKlxotVoSIMpvon5hgACoNIlkjW4DcsD4tpJio9rY/A3sb6WHCDxy0bt7MnaDOUsZPTj
	64+l1qkQ==;
Received: from ip6-localhost ([::1]:44758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVYuZ-00DGH7-Qc; Thu, 22 Oct 2020 11:37:39 +0000
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:29018) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kVYuS-00DGH0-SR
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 11:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603366640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqHLJJIzST18v9/q7u+MkgDwY/Vo6eeYgnN/nwG0Fuk=;
 b=FHb2u79q9+NZCUTqk9ScxYgfOHjTIStH1IffA/DWAfblkGlbDmEVfuRr0pA/5JDLXkVnPz
 V5Q30PB4kMF1nGXrLRP9UmPTXCEUYsf9rXX1DhFr4FoTtHMde5r5ep3Zz6rEf+r37LBvI+
 VnM1adkvY7klogwV4Iqmbx4XAP96l38=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603366640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqHLJJIzST18v9/q7u+MkgDwY/Vo6eeYgnN/nwG0Fuk=;
 b=FHb2u79q9+NZCUTqk9ScxYgfOHjTIStH1IffA/DWAfblkGlbDmEVfuRr0pA/5JDLXkVnPz
 V5Q30PB4kMF1nGXrLRP9UmPTXCEUYsf9rXX1DhFr4FoTtHMde5r5ep3Zz6rEf+r37LBvI+
 VnM1adkvY7klogwV4Iqmbx4XAP96l38=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-KUmTKig4O7mz5o6Zerr1jg-1; Thu, 22 Oct 2020 13:37:18 +0200
X-MC-Unique: KUmTKig4O7mz5o6Zerr1jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tct74mRYgFboSU5GD+/KQ2KpABwKBoqaK5XEyqNZOo485zdhpYdXQJJE+o/tqUYKK4Rwo0+wt8ZXwzwae+1b+XVbHgqmoVdeWv9d6YoX7omhEwzp/tM6t5peiAlxB7RE9INTptf7HugG3XTNJipw4ePMAzmxvdZhsGp8xVzrYuWVDIljpmkUnB4hBkWris6mUo/rfQFAVD9BB6RylXgM2tD9PL1EOt+MEQZWYhmJhOklGyqnNNSW9SSv0S6BGNEqV2ig+TxBdb0Gf4HVxXSWd11zB6BiPEN7O9Af/gCsPGqmGks1NWeLYFwnKU6pxm+1RJygWpvseK5kHnTgLcqBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqHLJJIzST18v9/q7u+MkgDwY/Vo6eeYgnN/nwG0Fuk=;
 b=jrWKcLY8KS83AMCJmRGQIXa2282O771ZZU/3n8YQdN+wQ2UO6jpnVu52iTq9GUg0xeEpUyykovTRTH07YqX58SIbPbJ+xbj/SiT6o5oV4tK9wiqbsbNOjGrJqimtBfyrg9l4xAPMITxcbndsJJNJ0ISMZD7yRhUPkoifniuK3gssmH7c7HqR5KPSB2fF59IRCYSts+RKQYd2K+y3NBlyGRnGp7NLgYsgvon3ZecFWvSieGRtUQMXUw19OgXLSnDif0kJXVWmi9ncWcejWT9Rm3y0c0HrewE4msBXHDpwqnoT7t7JeYUFKjJ2bJSicHiZIN8rG3X9dL6fMQrqo4oYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Thu, 22 Oct
 2020 11:37:17 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::e01c:2732:554a:608e]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::e01c:2732:554a:608e%6]) with mapi id 15.20.3499.018; Thu, 22 Oct 2020
 11:37:17 +0000
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH][WIP] query smb3 reparse tags for special files
In-Reply-To: <CAH2r5mtmPxUKYYK-PbouTFpt9T8AU-41pRZu1CEO=+XLZZ+vSA@mail.gmail.com>
References: <CAH2r5mtmPxUKYYK-PbouTFpt9T8AU-41pRZu1CEO=+XLZZ+vSA@mail.gmail.com>
Date: Thu, 22 Oct 2020 13:37:15 +0200
Message-ID: <87wnziv6dw.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:6807:8347:7696:25d3:a22f]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:6807:8347:7696:25d3:a22f) by
 FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.8 via Frontend Transport; Thu, 22 Oct 2020 11:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ee2366-a249-4041-4f82-08d8767ed440
X-MS-TrafficTypeDiagnostic: VI1PR04MB7071:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qt7yFs5usP+t7f9gCdwzNPS+RcGtja86ZjY0o9DLM46rPDqYQwuchBOeFjOKNjEvM1cPuUiXvRYkrJYPDUVCwWMD3j3KtTjjGRGaWX28J/3tnTxQ1sRcGytoHif8LwIxjyQPYSGLODZCBPWC8IsM9N63UwIB5wYggruSIe9pWJbYWV6f7J3ge3Y0FbebD+ZzMs1JjquvB3O+u8AgYt3IVIUhL5krM8bm3AbLycG1FDJj2cKs/bpXRNIidfpd6Y441LXf1csRdCCXOf/XXvmAkfgmGQiivDeRfS/fzqBOKJg1B9TPBLmkQnpygoQA4m4HpLuGpde7hAeprOsiCMeDzA==
X-MS-Exchange-AntiSpam-MessageData: YWORHVlWbyyz7jNVbh8UiJDJ76i+nu9Rw4jEe8tmZyenokB05weBrPCoJ/BNIDwLqikT8TGeHlS2ra8m6Sb/WzrKAAkUdUSKogIgz9Fd1AE2Vyfz3tzXetT48Mip1QsV9c8Quy0szPsbcI8U/8w58QyS+RGukhAztOFygKKTqYTPuytOwgP+5rWtT+g0TjE6dFZS6nqic03DHg+h3y1CQPC0jgOJCzIIi8MIm/rm8GLA1eFdyqlpZb1b9cS7E5KCBKDB7ftzi7NI40PejdRh2F77vGJSK1Nnk4xqxmFhu58pmUgAEF2k+19VWFCoMJE3u+JTGTpbTOdBdNOVUlC8BnQmCfD6GanQrkJeIx3GOj3ZaEXnuqkaCJRnH+S+DVC6i9nLjrsOiMSgG27b+D/KwsNQpwdpzM4icZgmJyxXMIuU0UQFRD9hBwKxMRieQxgKHnrfqAp2nu2nETqbtqmOBzQCKgELSiTY2vKDJBU5MLEL4EUfd2iLxcQsdHTG4VJi2d4q/9CH0y9xTnPC9yMMxTBxz+hO7eIBb1UmH8B8QakBAW2YasqxE8AveDibk/XZzggHcVGLxM7VFSyT9ewdQ1YmHDtRuxX5f4IZaqGJIuo/ITtyTy1ABHqc3OlLD7TCiFX2CVbk2iHGCzbQ+gk0ePP8dGPlqcISKSzTSkTAWSvHpWkktVT1gtmczn2Ud3uRoibWlEk1l5uMCdpOMRukmQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ee2366-a249-4041-4f82-08d8767ed440
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crQ8bv8cX/N0p/y/i+gx0zBsdH6kGoRjqaYm8+PxQYMBVCp2Er7LISHvsptMbIAP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Steve French <smfrench@gmail.com> writes:
> smbfsctl.h:#define IO_REPARSE_TAG_LX_SYMLINK    0xA000001D
> smbfsctl.h:#define IO_REPARSE_TAG_LX_FIFO            0x80000024
> smbfsctl.h:#define IO_REPARSE_TAG_LX_CHR             0x80000025
> smbfsctl.h:#define IO_REPARSE_TAG_LX_BLK             0x80000026
>
> These also make sense for us to use more broadly because it simplifies re=
addir
>
> but ... my first attempt at querying this using infolevel 33
> FileReparsePointInformation (see MS-FSCC section 2.4.35) failed ...
> with Windows 10 returning STATUS_NOT_SUPPORTED when querying various
> reparse points (created by WSL indirectly) including fifos, symlinks
> and char devices.
>
> I can switch approaches and try to do the smb3 fsctl to query reparse
> info instead but was hoping that query info would work.  Any idea if
> there is another info level that would allow me to query the tag?

According to [MS-FSCC] if the file has the REPARSE_TAG attribute, the
EaSize field must be interpreted as a reparse tag for these info levels:

* FileFullDirectoryInfo
* FileBothDirectoryInfo
* FileIdFullDirectoryInfo
* FileIdBothDirectoryInfo

Otherwise we have code for querying the reparse tag in
smb2_query_symlink():

	rc =3D SMB2_ioctl_init(tcon, server,
			     &rqst[1], fid.persistent_fid,
			     fid.volatile_fid, FSCTL_GET_REPARSE_POINT,
			     true /* is_fctl */, NULL, 0,
			     CIFSMaxBufSize -
			     MAX_SMB2_CREATE_RESPONSE_SIZE -
			     MAX_SMB2_CLOSE_RESPONSE_SIZE);

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


