Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BF92CDF1
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jul 2024 11:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=N5uQIt0OLnZ8UyQJIxIL9prRvuRN+HxSoh66P1AYBy8=; b=VWG1CJamkBZeYO9mFUbX+tkFKr
	nywhWX6nhvOnnxm9mM5u9ApX4vc6kmzOJ477sYz/LZT6x1n0bBiUr31F/blChhxkE6xipJ7bJjmYg
	UfDcSBYdp2+3cTxK+9PhjetOu0slYTeDP+dLY5Hy3Lx4NV/ZcWTaEFwYmgFmuxj9WJGNtlOYbKmkt
	sjFLFR3aSj6ghDCoR2GoWkDrLteW6aBoH+hTM5mkf1q8IGj1ef24ZNlHYuYR6BzgtNYtWHn3kZDjC
	FvWBpUBI6keZPdk5kCXnnHMhn2vb8PV52lYqK9pEvwU0QS6/aRG8wufdh/ZIttUTkfZj0eXNZ5Qbv
	53fdEdWw==;
Received: from ip6-localhost ([::1]:19774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sRTJx-000Luc-5a; Wed, 10 Jul 2024 09:09:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63386) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRTJs-000LuV-KO
 for samba-technical@lists.samba.org; Wed, 10 Jul 2024 09:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uhyut1BcQHzdWl2Trn+FgqX7X+2u/PBZWBhx0Bs6bP0=; b=nLIzs1nwsv6YFwNsRfLepE+UcK
 qQVTiZVxIYV4DTFmj1QzWkKVTlNJwbmUXx8+InX8Xskfd2hT9Gc+lwwebSUemu5mlleuUEdZJxj0/
 nxgcPBjSVlOO+nDlzqNc+5eXB7K0S30nhD8EhJjEg0gEDMb0e0Fag6pavr98nnqflIDUgwLt9jBBP
 79ETgmnHzqS/mUB+fZBt/RJ9ntuG8GwWMRnW/7YzGOvEOwWFE5uB7w6/xEBBkiPRauZaR+NXnZjwq
 6eJraGuOeUc/TdG0DkPP3FehugWyNIPseGZEEKF6D9BKpg8hJzdvT9wtPpYtb4X5a/NwCJX6wyls6
 TmXxmrLNINyawyvVidwfSwkVUVNO/PG3pAqEJs2TyV5l3CVopzyNz/z/dyoP6DfoX21frVLqc/6rd
 Hd/Qiebz6lvNtkupzUzhCnt+Cu6rg6Ll5dNYqbUHinFLiHOQ2u31NVqGfqMIWFLizKE6J6LYNyx6n
 X7hSUZSpTaU3k8S5e/TuvWL9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRTJr-000hk4-0U; Wed, 10 Jul 2024 09:08:59 +0000
Message-ID: <013b26e5fc784d1286303a15a93a62afe69fe733.camel@samba.org>
Subject: Re: problem transfer domain dns zones and forest dns zones
To: Omnis ludis - games <sergey.gortinsc17@gmail.com>, 
 samba-technical@lists.samba.org
Date: Wed, 10 Jul 2024 21:08:54 +1200
In-Reply-To: <CAAu4aPGRqJd7sGeocixh=Zkv0X85HSXtJcJZsM7VM7gPVQx=Wg@mail.gmail.com>
References: <CAAu4aPGRqJd7sGeocixh=Zkv0X85HSXtJcJZsM7VM7gPVQx=Wg@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Wed, 2024-07-10 at 11:34 +0300, Omnis ludis - games via samba-
technical wrote:
> while transferring fsmo roles I encountered a problem transferring
> theDomainDnsZones and ForestDnzZones roles in samba 4.20.2, I went to
> thesamba source code in the fsmo.py file and started studying the
> code snippetin the Transfer_dns_role() function
> if master_dns_name != new_dns_name:        lp =
> sambaopts.get_loadparm()        creds = credopts.get_credentials(lp,
> Fallback_machine=True)        samdb = SamDB(url="ldap://%s" %
> (master_dns_name),                      session_info=system_session()
> ,                      credentials=credits, lp=lp)and then I
> discovered a problem in the line SamDB(url="ldap://%s"
> %(master_dns_name)you must use new_dns_name, otherwise the following
> error will occur whentransferring roles.Failed to add role
> 'domaindns': LDAP error 53 LDAP_UNWILLING_TO_PERFORM -<000020AE:
> SvcErr: DSID-03152DA8, issue 5003 (WILL_NOT_PERFORM), data 0since the
> ability to make corrections to the owner of the video isprohibited by
> MSAD, please fix this in the next version of Samba

I assume you mean that the change to the FSMO role owner must be made
on the new FSMO role owner?

Perhaps submit a merge request with this, including a test (or at least
checking that it is covered by an existing one) if possible?

https://wiki.samba.org/index.php/Contribute

Samba is often not quite as strict as windows, it would be great if
tested changes to tighten this up were also contributed, but that would
be a harder task.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
