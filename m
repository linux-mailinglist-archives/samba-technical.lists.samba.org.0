Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973170E91E
	for <lists+samba-technical@lfdr.de>; Wed, 24 May 2023 00:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+nVBZuBgcji+1j4qtgc+iB02oqboGs04iLJSwktjiJ4=; b=JBC7c2ijvWDE9abnTstvrdlKmZ
	wK+bPmmmg+AdXlLgmiRcpQC6tdMbt2EqNVIgABA7MpJgCO/Yt8N9vaqY82xvq/6ETfkgOuSyjxJ1z
	lpJ0ttidk2lxcmmkqsWGYMhWiEFPJ3J89puhnAlY9cyyUFcB1/ZyRthdxVESy7TBThE3Byqxn7sNZ
	07nmlFxo0C/lGhEaJIgXXQToMwC9n+upHobINdog1L0/BaJOBj8BWuRCBYQm9xdX+bt1QQ2Ps8p+Z
	3RKviyYcQvphaWu3BczfhvRG/s2oGCFuyrBUf9eo+ij8BZfxwyUOUTmL3vNL5RQBVZ6rpkRdpzh5x
	s7E4Fudw==;
Received: from ip6-localhost ([::1]:61430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1aaF-00Blgb-Ve; Tue, 23 May 2023 22:34:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64404) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1aaA-00BlgS-Pm
 for samba-technical@lists.samba.org; Tue, 23 May 2023 22:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+nVBZuBgcji+1j4qtgc+iB02oqboGs04iLJSwktjiJ4=; b=qj6YMUGmM50olz9FXyE55DxQtL
 8NDtQDKl3ZMbWSgt+RFHPLxpyXvHiy6Kalvt9wYVorEywxRva9vVCNgFyqcbL+5rELZGHgQDQ4b02
 KnAaHggpayGzcdhzrdPnyJn9KBHrmK2ELsqjhlVazR8xFkTwq6xrkvMWk3KMdE3Vzirpo+zelL5T9
 epKVXGgRnFGdnda6d+34gHRqcBJl1aallVKZN5GGTk6E9VvwSY5rCRs8ojTEYa6v+ZAQGX9YoWcmX
 4jl+a16DasbeXYY1/ytNj1fIAMT7uPTsLZ/NqvrNfIFI4zWAUfqq7GxdxUayi3t7sfaPnBCQrmJ5Q
 QMtOepQ801+abINE5x6WIffEwQljnD/wApHDOwO8Bzy8lzTA31jP+yx7OOTaj+pvalvwYZgOpGtRf
 al/D0vTGVmRAG0XgChcZizM2+iHW3MrxiigGXgrn98G1yqWBQqBiYDwFLJ52QgqUpOZD1j2Jv66DF
 Hsl9x5qyvA8JVF12VCUPu+7X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q1aa7-00BaLM-Lv; Tue, 23 May 2023 22:34:16 +0000
Date: Tue, 23 May 2023 15:34:11 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 24, 2023 at 07:44:36AM +1000, ronnie sahlberg wrote:
>On Wed, 24 May 2023 at 02:25, Jeremy Allison <jra@samba.org> wrote:
>>
>> On Tue, May 23, 2023 at 10:59:27AM +1000, ronnie sahlberg wrote:
>>
>> >There are really nice use-cases for ADS where one can store additional
>> >metadata within the "file" itself.
>>
>> "Nice" for virus writers, yeah. A complete swamp for everyone
>> else :-).
>
>Viruses? I don't think they use ADS much since most tools under
>windows understand ADS.

https://insights.sei.cmu.edu/blog/using-alternate-data-streams-in-the-colle=
ction-and-exfiltration-of-data/

"Malware that takes advantage of ADSs is not new. MITRE lists over a
dozen named malware examples that use ADSs to hide artifacts and evade
detection. Attack tools, such as Astaroth, Bitpaymer, and PowerDuke,
have been extensively detailed by various parties, providing insight
into how these threats take advantage of ADS evasion on a host system.
Authors, such as Berghel and Brajkovska, downplay the risks of ADSs. Our
opinion, however, is that ADSs introduced the host of concealment and
obfuscation techniques outlined above, but little has been done to
mitigate these worries since their publication in 2004."

As I also recall the published US "hacking toolset" also used
an ADS on the root directory of a share to exfiltrate data
=66rom the target.

ADS - "Just Say No !"

:-).

