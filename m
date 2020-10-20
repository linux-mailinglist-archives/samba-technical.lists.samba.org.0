Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B31293EF3
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 16:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=; b=IKkoxuRfYpfdEmSgz4r8V3LVc2
	ZrOeqYNMUHwNOjyRwEs6zKgcoWzZQTLjNQ2kIaODENkYQSmC7GI1fE8sn1a7md2mQrc35dJzOIkA2
	rkRwCBHN4v25+h4L7W0bzN8/uE4bkB69utPqFzC9aGjpYvMOVNU59oUNwH7TB347BeIBpyMeN+aIA
	LdRR6ybdNbtLmRc0qbg5VPLhHTjQel2GzpRMQNccRfelnAkziiYfcmY0YCo1zQeuSFdCS0OU28cBF
	NBUskJGsw579yb2bsRVZyuCziRlxyuVfuMLKbVGoMhRD3DTkHuIfHiNoQL4qj7HJpAO1a5gq5Xdky
	/UU6NYiQ==;
Received: from ip6-localhost ([::1]:42632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUstC-00Cs81-Qj; Tue, 20 Oct 2020 14:45:26 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:56376) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kUst7-00Cs7u-FJ
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 14:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603205118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=YSmxpLLsWr9/941ZwBqVmMjdWGkzr3tXzzJhiX6SrStOYA03nwgvJgtbBwxP9efyN2Fsfo
 M9WJbSq/bZxw9VsjeIatd1p1ODYrZ/BQN+H5yfEhVyTHqYGsrvWJOO7LMQoX9UH7bgwz8m
 4iZ1y5SHn1nqAiVpCS3HRCWlI7mMgkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1603205118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=YSmxpLLsWr9/941ZwBqVmMjdWGkzr3tXzzJhiX6SrStOYA03nwgvJgtbBwxP9efyN2Fsfo
 M9WJbSq/bZxw9VsjeIatd1p1ODYrZ/BQN+H5yfEhVyTHqYGsrvWJOO7LMQoX9UH7bgwz8m
 4iZ1y5SHn1nqAiVpCS3HRCWlI7mMgkQ=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-6tG5QrSoNOiLy7OtPdEK3w-1;
 Tue, 20 Oct 2020 16:29:13 +0200
X-MC-Unique: 6tG5QrSoNOiLy7OtPdEK3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eobax0F25boipUMjA2cTrn0BSs4YDxXXlFnHweV0Kr5crj/EfnjrCRR0lodSTS7bu5GHh48ZB/bFvdzZqCZB9TcZtBCKG3+z/KPaK8fErqr5uu8fEPai3o6jmelcTq49hf0OE2YzNHtdAoKDZog3GD8EGGpRdfiCD/V8HmJ0MrHpn3Yb9OWDcIHTWWmn3O72zeFQTbu5nBe5j8HM5pz1geUSZ36UQ2gN72C1eTO/jwZqLftq0lMC5qwI4kuIbFQIiXOEyCTlS/nzDBpBCNU5iM409sXIjzqQb3G1di6xbZSGbsSfCOXphlrAQVOTVwLxZLng55QnCaNkOjfEim6yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=cM4b5rWZGue2mNgMS7AMdcZNg/Sx4pgC9ZFM3SgKaUm4lbs+Ey4nq5UtcsTJhy7UhY2gZwYai9+MapUgffJ+EgnK7intCbd8vqRJZeK+BX4FbtAzw869OG/znOkfM5nKXWBB0TT9NzjMtCLlVsud+6VBJk0NCIluh5XfLJxdTy909qPCMHJTI37WmiyS8cGRuyAL2V+u9B6ISiDVAEObOenzYtjJATz6fTYFMz7YLABZ4UMfYxxBRLr9R91zZcEpkrQdu1cYr7qa13WxZKtreJ3Ea81kvfI9Zw39nZtWRA2sOlx5iJslWvf2t6aR+tC2XoQz5rHtaZrSHLUQLqd8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6449.eurprd04.prod.outlook.com
 (2603:10a6:208:16f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 20 Oct
 2020 14:29:12 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::b504:9b42:67a6:7f5f]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::b504:9b42:67a6:7f5f%7]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 14:29:12 +0000
To: Colin King <colin.king@canonical.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Subject: Re: [PATCH] cifs: make const array static, makes object smaller
In-Reply-To: <20201020141936.52272-1-colin.king@canonical.com>
References: <20201020141936.52272-1-colin.king@canonical.com>
Date: Tue, 20 Oct 2020 16:29:10 +0200
Message-ID: <87mu0hezt5.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:6851:cd9:265:d9e0:b6c2]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:6851:cd9:265:d9e0:b6c2) by
 AM0PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:208:3e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 20 Oct 2020 14:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 009b3f9a-3774-4780-6ece-08d875048389
X-MS-TrafficTypeDiagnostic: AM0PR04MB6449:
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k1I1AUX9tvt86AK4qpPRUDXKum6iil4v6sFngdsWSKH+mbTNMgK9VP+sy0rcvHvfTwxFYg+KlNn2SPavWrtDIRKjy+jnkXtglGawe83ek1NuI59lrO9Hj/YC7b2tMlaAC0qeeykjYAXpcqAKU7h4OX7SUhpKNwN+JEW70vkKNyNNj6eEVyFMJ+OokN18WBIU6myjbaNWqetvD02BXY7SuuObf/bbIrLt61f3u26+D/dEReDoEwjt31NkXHbZdVTwIhSGQ7Kn21inUAZ5yFRffOnbSGp1mKEbDMUCRSExZeCmGGKW2ibTkVc+QHHLuMm0Rlb8SBkM7cXc3O4lLDc5yg==
X-MS-Exchange-AntiSpam-MessageData: x6KFFhPPUWttASFkgaS3TSSoe8vE1IJI4A630TVl9EzhLgAURnXw2pjCSJp4enqyXxsEfynf2H9mvYwkO1MgypOz8nyjOvuSub5rpN9l6Jh+e54VSQc2tFpagc6oYzqyUVgdDYZzkmnVgHa9eoNJLFHbfrtY8O6o/ucRu8OOLfUoBLP4WxFVHvtp16IuyuqbPwyCnVbSHQ/7hw7D3YWH25lfql8FqakeTHEDw6Z0iPnePhYEDU7h5ecUsF5C7Dla8xA658vMybMx0Fhq4vhhnM9mC8ztL+yUIyzvoBssXAn3onUtBzYQxzf5vdJD0Kfs+jftdV3f2+ufs4sxtkHA6HbP3jMm2VT+mmgvxG7EyAuLE3SdqG7muURuXk+zoxoA4DXmuvYQoqwbzcgeN9a4rwxLBXcKc4Ilb6LVo5VWyNVb2wcS5KN7Y+Sa1VxecHq2Hlv7fpXGC2oRWswN2+0yLuSUC621sxuhwjGLq7baO3En9OSMKXfZuwK8zm4STvvrDhplRgjh/9ETRb4RC+Sw531mDP+bNayPi4pXLdhrjB+Q32Wx+nXjNtU6BovhMTxoei8WybP/zb0F61ziYmMYu4oYaAVyR7XeSB4N4erqf1HL/MDbGfuhdllYMD5OipMD6H5GrqWRZMbrcYTWNg28WWs1acqqb8crWwn/d1cwFECkdp2AP5v7j+4vTu6ibjkOueT0a4VY7OqMuLWPVKvCGg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009b3f9a-3774-4780-6ece-08d875048389
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwpaqaN1qx7A0f1f7t31Lzp4h5KY39AiI/loHjIFg4UTr9SlPloZOMbDaXcDnucv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6449
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


