Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC25726A931
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 17:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rFhTTDwPH4dTx40if2O0MlzI0xpqEgxQaGurzGBXe+s=; b=aPOc0CMyhPBh+e5OBmlFuQ0S17
	8I61N71htGCKG+Vc6enrsV1WYJev8PYOtETdynXJrvxSQtp/uaZn2gDh4DeyW7LXCk3zostL8vLCg
	V7VVR4NQmt0jJmrXDNIMdTl+kTjKYBxapgeYEJ+1wjn+7dvAE14m8/l1qb/9uWg5jHWw8B6mDTKiY
	bvzAulUaWPB1ySd4eqdjobVi+YH+zchfeq6l/A8JAYBodVswRdZEK6tEQkd60Oc4/Zj23wLPaAcGc
	ib2ClOtgvdN5OFEw7Q7g8/Zgi515Y+UMAjWQ/zs2bnSDpZEmtJYpkawdCezEEWwpSlg9Dal5KhGFu
	bhLAL1aw==;
Received: from localhost ([::1]:39916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIDKE-005X3D-9O; Tue, 15 Sep 2020 15:56:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIDK9-005X36-Hp
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 15:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=rFhTTDwPH4dTx40if2O0MlzI0xpqEgxQaGurzGBXe+s=; b=G/VFgbUtkvSKyf3EruXfD2ZDyw
 BYEaSx7HyhDVUw+hchrJ8eXn//0uPIzPtNBLQIT90V/kmcdMD32VHslu5pntS/tRF+Zq4lGmb3m8y
 NVB0e/IWnCHngY/0s5FIF3gqT6rlMlL/dCv00QNjPqLPEZhFCQ0F738+yUk3fVuMPpsUM8STFDN0z
 /b3QdAaHp5mE5l3nRN7zSJ9yV3b++hlm6SwoHYj+f6Wi4mht3bW3EHFa8J9zkPaPpcnBvwJdHNEBF
 mFIyGA/ZckqCscKfDvVTM+4mJyPxAlGujW+i9o9+lSkNehgiC7MLnaDDlmcEfRnLeKd/xlApPs5Ch
 bRk/3ChyfW/FSOIplJwC2w9hnNlf1BYB2SMvVm/kmbSn0u7Zrc0nCEH31XcchRHgEjQeOa68m3LXF
 GPqcyGKWNahMVSWvN0QjrcLJY24lnwT/R+BmWMIASyP7c/P4RWIuva0nX4Rm3nGYem1bxnNu4uGlz
 WkQqWLv1b9VHI80a7RfUsRgV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIDK8-00025p-1K; Tue, 15 Sep 2020 15:56:52 +0000
Subject: Re: SELinux attributes in Samba domain
To: Alexander Bokovoy <ab@samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
 <390168ab-7835-5750-cfca-3327596618b3@samba.org>
 <20200915145247.GF23377@pinega.vda.li>
 <597958a1-3c75-8ea4-cf8a-cf9c7a4e76ad@samba.org>
 <20200915150621.GH23377@pinega.vda.li>
Message-ID: <9fe16073-86d7-0828-7ef0-87832d0f80fc@samba.org>
Date: Tue, 15 Sep 2020 16:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915150621.GH23377@pinega.vda.li>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/09/2020 16:06, Alexander Bokovoy wrote:
> On ti, 15 syys 2020, Rowland penny via samba-technical wrote:
>> On 15/09/2020 15:52, Alexander Bokovoy wrote:
>>> On ti, 15 syys 2020, Rowland penny via samba-technical wrote:
>>>> On 15/09/2020 14:38, Mikhail Novosyolov wrote:
>>>>> 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
>>>>>> On 15/09/2020 12:08, Mikhail Novosyolov wrote:
>>>>>>> 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
>>>>>> samba-technical <samba-technical@lists.samba.org> пишет:
>>>>>>>> Your problem will come with sssd, it isn't supported by Samba
>>>>>> (because
>>>>>>>> we do not produce it and no little about it) and even Red-Hat no
>>>>>> longer
>>>>>>>> supports it use with Samba.
>>>>>>>>
>>>>>>> What is the problem to use sssd as a client to enroll into Samba AD
>>>>>> domain?
>>>>>>
>>>>>> Before Samba 4.8.0 , the smbd deamon could contact AD directly, this
>>>>>> meant you could use sssd with Samba, instead of using winbind. From
>>>>>> Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact
>>>>>> winbind, it can no longer contact AD directly. You cannot install sssd
>>>>>> and winbind together, they both have their own versions of the winbind
>>>>>> libs.
>>>>> Yeah, I know that sssd has its own libwbclient.so.0, but did not study details. I still can't understand the initial problem. If sssd and wbclient conflict on the client side, samba's winbind may be turned off, right? What does prevent from using sssd as a client for samba domains?
>>>>>
>>>>>> If you want to extend the schema to store selinux data, then this
>>>>>> should
>>>>>> be possible (you just need the correct .ldif), but you would then need
>>>>>>
>>>>>> a tool to extract them from AD.
>>>>>>
>>>>> In case of using pam_winbind, will it be sth like making an ldap query (using ldspsearch? or which tool will be better?) in PAM stack after pam_winbind, authenticating via kerberos and making a query for the current user name?
>>>>>
>>>>   From here: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/assembly_using-samba-as-a-server_deploying-different-types-of-servers
>>>>
>>>> There is this:
>>>>
>>>> Important
>>>>
>>>> Red Hat only supports running Samba as a server with the |winbindd| service
>>>> to provide domain users and groups to the local system. Due to certain
>>>> limitations, such as missing Windows access control list (ACL) support and
>>>> NT LAN Manager (NTLM) fallback, SSSD is not supported.
>>>>
>>>> I do not care if anyone says you can use sssd, the Red-Hat documentation
>>>> says otherwise and they should know , they produce sssd.
>>>>
>>>> Do not think that you can use sssd on a Linux client, because as soon as you
>>>> add one share, it turns into a server as well, or should we just tell
>>>> everyone not to use Samba as a server ??
>>> It depends on a use case, as always. Running Samba server on a client
>>> enrolled into RHEL IdM (FreeIPA) is supported as a technology preview.
>>> This might give you some idea of a direction where supported
>>> configurations are moving.
>>>
>>> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_identity_management/setting-up-samba-on-an-idm-domain-member_configuring-and-managing-idm
>>>
>>> Rowland, I think you are overly complicating the situation.  There is a
>>> certain amount of work to do, sure, and we are discussing what is ought
>>> to be done to get that working. There is no need to critically
>>> force-reject anyone attempting to improve our options.
>>>
>>>
>> No, Alexander, what I am pointing out is that Samba doesn't really need
>> sssd, so why waste Samba development time on it. If Red-Hat wants to make
>> sssd work with Samba, then that would be a different thing. Mind you, this
>> is just my opinion.
> Re-read my recommendation and you'll see that what I proposed has
> nothing to do with SSSD. The suggestions I gave would work for any client of
> Samba AD DC, including pam_winbind. They aren't for tying anything to
> SSSD, btw.
>
> Let us focus on a technical part of the discussion.
>
>
I am all for improving Samba, but only if it doesn't tie Samba to an 
outside project that Samba has no control over. Samba has been there 
with Openchange and that didn't end well.

This thread started as a discussion with regards to Samba and sssd, it 
now seems to have morphed into a 'how can we improve Samba' discussion. 
I repeat, I am not anti sssd, it has its place, but not with Samba when 
it means setting up smb.conf with a backend outside the control of Samba.

Rowland



