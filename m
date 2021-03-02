Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A332A1AF
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 14:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AC8OAFukL+ayIQoVlwzAsL93T0KzWAXx5ZV4NYj0U2g=; b=YLcYtxrRQopm1ub/OB5G3ZkrNc
	DJf5B7hchWbCDjQKF//TnOmvIF77Um/j6Bkt/xcATyZ6CvwvdUKDPX79Bebz5v9+fHpgYfgkE0hDV
	lOuFtC9mwBGk1YAopUTiVg4VdG74QJuFUnUHUeZmF68p+LcbktrOYDFom6OwOBQPbFyVtydJEQRLz
	QrFBHRx/ncn9j9f74V2Dqhk0clsd9iIS8iiHg/IAJQtT+V0VDQ1CeAfN7/aJ7T7CHX+EKngR5cZIE
	R2zViGfqr/lDghTTnFbOjILfKmLN3C9gdAdbfV2FlNW7bx4z0ECzL5vbmDLk+9dEOp+K0fNUDkxsZ
	oeRbTvIA==;
Received: from ip6-localhost ([::1]:30606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lH5Xz-003rLx-Gp; Tue, 02 Mar 2021 13:58:47 +0000
Received: from p3plsmtpa09-06.prod.phx3.secureserver.net
 ([173.201.193.235]:47773) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lH5Xq-003rKl-Ta
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 13:58:41 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id H4qrlCmi3YxqlH4qrlwrad; Tue, 02 Mar 2021 06:14:13 -0700
X-CMAE-Analysis: v=2.4 cv=Aal0o1bG c=1 sm=1 tr=0 ts=603e3a25
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=OlwOBiMxYwKKxBz67NwA:9 a=QEXdDO2ut3YA:10
 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
Message-ID: <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
Date: Tue, 2 Mar 2021 08:14:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEJK5RO3zLw7++t3oh30NOepKWmYrPtFfOPZIt7RoEN4RoEQJvSMIAGEzGuzRqK3t2pm/0NNTRZ7mzk3YutjTLmpxUSrvgt0Jbiy2YbLR46250jtuNH1
 MgUC3lCL/Y52v0jLkHDVuQhqvUwqqGUfBhGXR/kE6Zb/WfGVsJ6Z4Of4RHpOkEXiTMKeg0BHGUEvm88JiGp4WmeYXsvVXCRdQmc6Evz1JyMx+IDPEt535sWD
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/2/2021 1:56 AM, Ralph Boehme wrote:
> Hi Tom!
> 
> Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
>> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC advertisement?
>> I find some mentions of earlier versions supporting F_FULLSYNC (no extra
>> "F"!), but zero mention of either fullsync or fullfsync in release notes
>> for any Samba/vfs_fruit version. Is that just a typo, in which case, why
>> is Big Sur complaining?
> 
> You need at least 4.8 for this.

Hi Ralph! I guess I figured Ubuntu would be off-by-one. :)
I'll upgrade, had hoped to avoid a full network forklift but
it's perhaps due.

I think it would be good to refresh the wiki regarding this.
I did find

	https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X

which does in fact state the 4.8 requirement in rather fine
print, but the page says things like "here are suggestions"
to "improve operability with Mac OS X", and "as far as I know".
I'll see if I can help improve it after I muddle through the
situation.

Tom.

