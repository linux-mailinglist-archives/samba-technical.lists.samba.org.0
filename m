Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D884BAB43
	for <lists+samba-technical@lfdr.de>; Thu, 17 Feb 2022 21:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LUCbeNT0mmHI+ldl63shmGIFJghkOceZpwGI2PfGkws=; b=JXtGuzqOXK3/Ca5j31CSp+WxwW
	hKBXKRcnERJXENcmNsYir2egHdRBv4pfVl+Burd7LaR+qUs6/DYXy4TdMbkJTMaFLTEVpVJhsstPB
	0lPioMf88vqU6b72EKiqivUH7fzdc7SUDr4v/wt66cFMmGe/cfMhfTlyfa88Ke3/0mRyBLJz+ojfK
	MWQM2l5O9RqiAnzo9ZuZ21rLQDJP3IMTvYhxhi/OgdEBG0ngGhl9LjYixV3/5Agw1PMqQDqSqvogh
	k1/2otoo92PM77C8HHf4/hDz6+UYMqUfGn8B9DEhRln/ms3OcMIkGyQMnXrJWJ/EedRe7exUfWfp8
	lrc8+Yhg==;
Received: from ip6-localhost ([::1]:49692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nKnge-009lw3-Gr; Thu, 17 Feb 2022 20:47:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nKngZ-009lvu-TY
 for samba-technical@lists.samba.org; Thu, 17 Feb 2022 20:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=LUCbeNT0mmHI+ldl63shmGIFJghkOceZpwGI2PfGkws=; b=YAVucGuh9sQZIKRKPhHGENEUl9
 xK1kOWAWJ88UJpE/4QVTEX+Rk/zMbO4stESwFzd4Mthz+4Hu1g3XEddPrX8oAcKUTrkyC7YrLrTtg
 dhdezWKo9ldQHnEPtDGKEipVf/bRedEJ+rBNSGDSJgBUwo0k4D81VlXrTSdTV9m89hU+Q2xoQDwlG
 XRCiXFlfF15JIhOzterwryleoNpP4foLySuKY0VpSBH/qaKtYIK05FQI6cdyntIQWtkmixJcven6/
 LxmtfbB1eMCp7t3Emxw/P/AEie6pdM0R8v0W4YDxzWH5NLtkMvVkQc9FKJ+x/Tm1HS9Is0P3ris/1
 QSuyIXLJNdWK6fkERqSM5540qvaZG0QWmFUjqQsBk5GkNPkZjvnKnxwwClt/iJAsbmt3dXBJ3b0U4
 AODYVQi/twnOJUY59KMncvXoOijfL27sPsrYmvcdGO5hhyc47ic8EEgF2Mhiw4WCg2oh6FDwisJYP
 RUp6+2YwzTA9aV4ywmw/4vlx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nKngY-004IkS-6y; Thu, 17 Feb 2022 20:47:31 +0000
Message-ID: <a50dfd9e0c06fd39fe2f5898c3395c1d6172436c.camel@samba.org>
Subject: Re: smbcacls domain sid issue
To: =?ISO-8859-1?Q?Bj=F6rn?= Baumbach <bb@sernet.de>, 
 samba-technical@lists.samba.org
Date: Fri, 18 Feb 2022 09:47:23 +1300
In-Reply-To: <625be554-b22d-e73f-e18d-6ee2df75d984@sernet.de>
References: <625be554-b22d-e73f-e18d-6ee2df75d984@sernet.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2022-02-17 at 19:13 +0100, Björn Baumbach via samba-technical
wrote:
> Hey,
> 
> I think I've detected a bug.
> 
> First of all I place a file "file" as Administator on a share which
> uses 
> the acl_xattr vfs module.
> 
> # testparm -s --section-name=xattr
> [xattr]
>          path = /share
>          printing = cups
>          read only = No
>          vfs objects = acl_xattr
> 
> The ACLs looks like this:
> # samba-tool ntacl get file --as-sddl --service=xattr --use-ntvfs
> O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;;;WD
> )
> 
> When I now use the smbcacls tool to set the ACLs again:
> # smbcacls --sddl 
> -S="O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;
> ;;WD)" 
> -UAdministrator%Passw0rd //dm3.temp.test/xattr
> 
> the SDDL ACL looks like this:
> # samba-tool ntacl get file --as-sddl --service=xattr --use-ntvfs
> O:S-1-5-21-3367907150-2849503042-2089288414-500G:S-1-5-21-3367907150-
> 2849503042-2089288414-513D:(A;;0x001200a9;;;WD)(A;;0x001f01ff;;;S-1-
> 5-21-3367907150-2849503042-2089288414-500)(A;;0x001200a9;;;S-1-5-21-
> 3367907150-2849503042-2089288414-513)
> 
> Is seems that wrongly the local SID (instead of domain sid) is used
> here:
> # net getdomainsid
> SID for local machine DM3 is: S-1-5-21-3367907150-2849503042-
> 2089288414
> SID for domain TEMP is: S-1-5-21-4063336984-1021020757-935970304
> 
> What do you think? I'm not sure whats the source of the issue. I've 
> verified that setting the ACL in the SDDL format via "samba-tool
> ntacl 
> set ..." works fine, so it might be an issue with the smbcacls tool:

Exactly.  The smbcacls tool is not symmectric!

On the get path, it obtains to remote domain SID:

		char *str = sddl_encode(talloc_tos(), sd,
get_domain_sid(cli));


On the set path it uses the local SID on the instance it is running on:
	sd = sddl_decode(talloc_tos(), the_acl, get_global_sam_sid());

The inheritance path does likewise.

I've confirmed that get_domain_sid() is also getting the real domain
sid, and not the local sid of the member server being contacted,
thankfully, so a fix should be fairly easy.

See also the --domain-sid option, but just because the tool CAN be made
to use that doesn't mean the default is safe (it isn't!)

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


