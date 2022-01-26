Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5649D01A
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 17:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=c6ELA5Ck8H6rL/1la2QVt7C1Kl5ru+M1ZlhRdjUTgNQ=; b=aOoBQb/Rxk6DH/eUK6+tVtuHZ5
	cdE79wBqrjxyVRdO7ax74wrQ5GOigX6ptfRN29oY9drb3CG67LL/PHS+PFgYiODoSIfQ3qun7PHu3
	Laj6G4r8L84pxHicwUrVsF6EMXHG0WkQgrEIuWh5pqUXYTqdYlPF2dgvRDTFmhIpvESrWcpMk8moz
	Rroy2nHt1i3jIcITnWIO/2WBoAfznjfJfCOyyjhdqLnThH737kAckvKthJMdQzIJBlB/34uOV+IPa
	7jes+gN4bXUbjSM61N5UhjH8Zwy0oq0pcsGpXFbTr9J0j3rmmIZ2r9y7NQERuYOYhudLdMuiYVaAG
	0NJZjb5g==;
Received: from ip6-localhost ([::1]:59510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCla1-0016et-IV; Wed, 26 Jan 2022 16:55:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nClZv-0016ef-VY; Wed, 26 Jan 2022 16:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=c6ELA5Ck8H6rL/1la2QVt7C1Kl5ru+M1ZlhRdjUTgNQ=; b=VaEs9W/T2kQkFMlKcuPxz5fmXF
 KfZDiVEupivDigFCDxkdJo8ZD25bdR2Vqw4wG0w2F1JoJkUUPBGym/Ty2HXPHwaxZwTBusuOvI/OF
 aBQWnIyvVAntBO14zitOZ4X06kYYvVbZNWbfiV4en3G3V4xH3lJWOjGZGtN4lG0G483IO5FjGe2Nq
 0GDjAHi+P8/O1h22bchVOHn/3WvgSUpJ3iFLMoZd676xq88jPvrWw7cVlvcOJewAWed+00hb5JZmu
 ilptfw2RPuaOw4qZjBtE3lbt0uuyOteLJUULpP9scOXaGqSsMuFCDTKdWKJMGxXP2x9bzb1NdEMIW
 VF/XGLZu63TGT5jPh7xEhxD6S6cnYUhWLS+v3kmIFqQ4P6dwcrbgg1+EZMQV8kOoO+YCEgFyL1yaI
 hIFr71gTqUjL3yCb3aSQFADpBGYGuoQasMdREoewZPsAMmzEsguE2HdfrHIoLPuJBZwzLHw+OB8Zs
 wUi+g/+RQNXFfWDbp+tpzXVd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nClZr-000jwQ-I4; Wed, 26 Jan 2022 16:55:24 +0000
Date: Wed, 26 Jan 2022 08:55:20 -0800
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <YfF8+OMLV0UkzicQ@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220126115058.GA936420@sernet.de>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 26, 2022 at 12:50:58PM +0100, Bj=F6rn JACKE via samba wrote:
>On 2022-01-26 at 16:50 +1300 Andrew Bartlett via samba sent off:
>> My feeling is that for the Win9X and OS/2 irrilplacable industrial
>> equipment case, that guest authentication would suffice, combined with
>> 'force user' and 'hosts allow' for 'security'.
>>
>> What do folks think?
>
>my gut feeling is that many users will be very unhappy with such a change.=
 I
>know many setups where the clients say that ntlm auth is still required for
>them and where guest auth would not be an option. Even on AD DCs sometimes=
=2E For
>sure on member servers.

Correct me if I'm wrong Andrew, but I think Andrew is not
thinking about removing NTLM, but only the storage of
LM password hashes.

 From the "lanman auth" section of the man page:

This parameter has been deprecated since Samba 4.11 and
support for LanMan (as distinct from NTLM, NTLMv2 or Kerberos
authentication) will be removed in a future Samba release.

Removing the LM password hashes gets a hearty thumbs-up
=66rom me :-).

But I may be miss-reading the original message. Sorry
if I'm just adding to the confusion :-).

