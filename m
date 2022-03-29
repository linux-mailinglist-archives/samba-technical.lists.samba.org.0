Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AE4EB409
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 21:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4ijmfgDgUW5SlkQ5GorckGCTAVxIyvOSB4LFBAXKseg=; b=GNiNyskAdb8ouEmwNVmBWTeh5p
	vjoLv7a5ltLE1/Wak/Ict/tXj/uvHCVPFA//Txk0mB4qGKM2zihIOZk0pD16TV/HcfFnsMtoFHF7O
	rmvKRowFEo94r6AFRD/HJJOU8263CPIKNGN+ffm67iRx7ueQhtyDP55hn/htkmx12GJ+cELft2017
	r3MCgvCNJ303l+nRrjQzlDnTfmvURD3CMcaffu4a2DRtyTsSklqF2DbGR8ywbvxSpsxRLVF+SILlV
	NvGqZr2FxQUV1agrtl6nGAFmVtmm9iNg7FiUzrlGMyze/pwMta7nW78314TwEvQbC+MoFeJ2qvRRK
	UPTdMw9Q==;
Received: from ip6-localhost ([::1]:59272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZHOl-006TJH-98; Tue, 29 Mar 2022 19:20:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZHOg-006THx-7T
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 19:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4ijmfgDgUW5SlkQ5GorckGCTAVxIyvOSB4LFBAXKseg=; b=RsO/uALexodxmdvLpXiGZcuMU7
 B4Ub7eD63UDTC/z9RV0MqrbVUKmBv74Lv63PW+QY02G+GYR23UWE1gmBL9e9CckzkhRfABhumSRNy
 I0hcgyKbVoLTeN5rRqYkqxZ+4yhgE9BMgAbU1H68q5LF1pnlEqvwfdH1z4/tKPbPNYsE0u6WANZb+
 9JLE5b+X4KfOa28bHFNlB0ktUYmbAdATb1ucjqgl+L5Aty40ruolV0pPx768F+Ij3mxscjwesAMNz
 rpW6sSQ/H3atewEJ+WiYk80Rr9OgPZHxSbhYrRb82UH6N99+I3RNROjRaxd+EIDHJKJxTLQMfU2Xr
 rTPv3DjPWR6IAffBcU1VEJSLsn+MwHZqqLLcAR1KlMkHBalgxoGoN6FNcID7/V8i7iD5X7Iqpj/km
 Dugeo4f91d9db0fj/fPXLSV6Vs4C3cT3Gu9EF2K9bEP4fVaRDTE+iD5sU9J4OT4Ue9GbGub8hLBST
 IrJWZz9g/ucN6ydsCe9NNPjS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZHOe-004Fvi-OM
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 19:20:53 +0000
Message-ID: <926eed4f-2c9b-ac62-a31a-e325d7c09006@samba.org>
Date: Tue, 29 Mar 2022 13:20:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Are there Python3 libraries for the net commands and etc?
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <YkHeJrztO2KnRMpn@jeremy-acer> <3853301.dWV9SEqChM@edfu>
 <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
In-Reply-To: <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 3/28/22 1:44 PM, Richard Sharpe via samba-technical wrote:
> 
> smb_mgmt_net_ads_join/smb_mgmt_net_ads_leave

These already have bindings. See the python module `samba.net_s3`.

> smb_mgmt_net_ads_status

This appears to just do an ldap search for the local host, to see info 
about the join?
You could write something similar using the samba.samdb python module.
So,
```
from samba.samdb import SamDB
from samba.auth import system_session
samdb = SamDB(url='ldap://some-server', session_info=system_session(), 
credentials=creds, lp=lp)
samdb.search(...)
```
The net ads status command searches for these attributes:
                 "objectClass",
                 "SamAccountName",
                 "userAccountControl",
                 "DnsHostName",
                 "ServicePrincipalName",
                 "userPrincipalName",
                 "unicodePwd",
                 "msDS-AdditionalDnsHostName",
                 "msDS-SupportedEncryptionTypes",
                 "nTSecurityDescriptor",
                 "objectSid"
With the filter: `"(samAccountName=%s$)" % machine_name`

> smb_mgmt_net_conf_list
> smb_mgmt_net_conf_setparm

We don't have bindings for these right now. It probably wouldn't be 
difficult to add them though.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1221 Valley Grove Way
Pleasant Grove, UT 84062

dmulder@suse.com
http://www.suse.com

