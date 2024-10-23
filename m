Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E79AD876
	for <lists+samba-technical@lfdr.de>; Thu, 24 Oct 2024 01:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Z+0+gMBeWDa7dx48hbyYINQ1WA++vX+nRewkjGCDkcs=; b=dwJs4BQjk5jilM5kX2ZC/xWEyX
	Oh9pNFo/mRFVo+umLpaXX5tt/3AjXP3kdzJ5P2MALEMdaBcWui0OafO6zAJDVn5rDJBbrRWKh4PzX
	c/q5xzZRnnPJdS7I5YAEKNMZ/V+J0B4NU4cj+KdqsZbhHbHNI9gBI/2sCrMJ6pqMnPOb5C+R4doWT
	IIdxM6ejFzVtK9onodwTzx7Jxt4TftfHW9J1KP2nHVpFaYYdkvO6ID8uXCPNpPioqe3jamONr5orP
	SnUov66MoVP18CmiwILiL+md8LlU8V15j+rzZ5bQGaZGuQekKvVH6+NPn1VHkPZNDte6Z8ONypK/g
	AzXU97iw==;
Received: from ip6-localhost ([::1]:34030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t3kpe-004sA8-OC; Wed, 23 Oct 2024 23:32:02 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:50906) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t3kpY-004sA1-4V
 for samba-technical@lists.samba.org; Wed, 23 Oct 2024 23:31:59 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id CE4539D;
 Thu, 24 Oct 2024 12:31:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1729726309;
 bh=1TVPPZbRamPeZiNoLIjWql3ovPJPEI0Qn6L7k2sKJxs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YBq93YQ7e84pCP6/BEDgbrGpq6GjyBSl1yjaoALjNDQWR4MTzOzgtLr4Ei336cV1q
 9XFhqBXk+McUWX1YHxcctOC/63mfYO8IkJqLk9a60vnR/eKzKERAvy+EgtAdtR1kmZ
 Y4oJxNzV1OGkQUKK+gTKExUdSrTBSi2DnuWOgKeHoy/nNkufLuNWCSEg2vgVjCuGyk
 67wv1Nlj17pjN473BmrjTJCSHeGUdGITkaNWcDFdKa/zyFkinAJlbYRr550VtiHDm1
 QqPouGfpJeXH3JtnzRQB+FLTNyRafCdu7AD2yVbrtIU2zw18Gl/p0/lptqEyeKaAWI
 8/CDcCr2bDJaQ==
Message-ID: <cb71c66c-f7e8-474c-9457-0e82b8b4e5bc@catalyst.net.nz>
Date: Thu, 24 Oct 2024 12:31:49 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
 <60405467-4994-4a9b-8d31-136871c5b721@catalyst.net.nz>
Content-Language: en-US
In-Reply-To: <60405467-4994-4a9b-8d31-136871c5b721@catalyst.net.nz>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/10/24 11:09, Douglas Bagnall via samba-technical wrote:

> So on a computer, you add msDS-AssignedAuthNPolicy containing the DN of 
> the policy, and the backlink will magically appear on the policy (like 
> member and memberOf).

samba-tool user auth policy assign --policy win11-policy  samba-DC

should put the msDS-AssignedAuthNPolicy attribute on the DC (yes, it 
does look strange that you use 'samba-tool user' to apply the policy to 
a computer). I think this corresponds to this step you mentioned earlier:

>> On a Windows-DC you now have to assign the policy to the user and computer but on the samba-dc this is already done: 
>> ldbsearch --url=/var/lib/samba/private/sam.ldb CN=stka --cross-ncs -U administrator
>> ...
>> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net
>> ... 

That "msDS-AuthNPolicySiloMembersBL" is the backlink for the silo (the 
"memberof" equivalent), not the policy.

If you have a --user-allowed-to-authenticate-from policy, you want to 
apply it to the user. With a  --user-allowed-to-authenticate-to policy, 
it applies to the server.

Similarly for "--service-allowed-*" and "--computer-allowed-*", the 
"-from" variants apply to the client, and the "-to" ones to servers.


cheers,
Douglas


